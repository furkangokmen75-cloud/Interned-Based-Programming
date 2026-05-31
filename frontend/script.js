// ── CONFIG ────────────────────────────────────────────────────────────────────
// Backend PHP dosyalarınızın bulunduğu klasörün yolunu buraya yazın.
// Örn: '/api/' veya 'http://localhost/foodsearch/'
const BASE = '../backend/';

// ── STATE ─────────────────────────────────────────────────────────────────────
let allData     = [];
let currentData = [];
let currentUser = null;
let favSet      = new Set();
let selectedRating  = 0;
let activeMenuId    = null;
let searchTimer     = null;

// ── INIT ──────────────────────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  checkSession();
  loadRecommendations();
  bindEvents();
});

function bindEvents() {
  document.getElementById('cat-filters').addEventListener('click', e => {
    const btn = e.target.closest('.filter-btn');
    if (!btn) return;
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    applyClientFilter();
  });

  document.getElementById('sort-select').addEventListener('change', applyClientFilter);

  document.getElementById('search-input').addEventListener('input', () => {
    clearTimeout(searchTimer);
    searchTimer = setTimeout(fetchSearch, 350);
  });

  document.getElementById('loc-btn').addEventListener('click', tryGeolocation);
  document.getElementById('detail-close').addEventListener('click', () => closeOverlay('detail-overlay'));
  document.getElementById('auth-close').addEventListener('click',   () => closeOverlay('auth-overlay'));

  document.getElementById('detail-overlay').addEventListener('click', e => {
    if (e.target === document.getElementById('detail-overlay')) closeOverlay('detail-overlay');
  });
  document.getElementById('auth-overlay').addEventListener('click', e => {
    if (e.target === document.getElementById('auth-overlay')) closeOverlay('auth-overlay');
  });
  document.getElementById('review-overlay').addEventListener('click', e => {
    if (e.target === document.getElementById('review-overlay')) closeReviewModal();
  });

  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') {
      closeOverlay('detail-overlay');
      closeOverlay('auth-overlay');
      closeReviewModal();
    }
  });

  // Auth tabs
  document.querySelectorAll('.auth-tab').forEach(tab => {
    tab.addEventListener('click', () => {
      document.querySelectorAll('.auth-tab').forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
      document.getElementById('form-login').style.display    = tab.dataset.tab === 'login'    ? '' : 'none';
      document.getElementById('form-register').style.display = tab.dataset.tab === 'register' ? '' : 'none';
    });
  });

  // Star picker
  const picker = document.getElementById('star-picker');
  picker.querySelectorAll('span').forEach(star => {
    star.addEventListener('click', () => {
      selectedRating = +star.dataset.v;
      picker.querySelectorAll('span').forEach(s => s.classList.toggle('lit', +s.dataset.v <= selectedRating));
    });
    star.addEventListener('mouseover', () => {
      picker.querySelectorAll('span').forEach(s => s.classList.toggle('lit', +s.dataset.v <= +star.dataset.v));
    });
    star.addEventListener('mouseout', () => {
      picker.querySelectorAll('span').forEach(s => s.classList.toggle('lit', +s.dataset.v <= selectedRating));
    });
  });
}

// ── SESSION CHECK ─────────────────────────────────────────────────────────────
async function checkSession() {
  try {
    const res  = await fetch(BASE + 'check_user.php');
    const data = await res.json();
    if (data.logged_in) {
      currentUser = data.user;
      renderAuthArea();
      loadFavorites();
    }
  } catch (_) {}
}

function renderAuthArea() {
  const area = document.getElementById('auth-area');
  const favNavBtn = document.getElementById('fav-nav-btn');
  if (currentUser) {
    area.innerHTML = `
      <span class="user-greeting">Merhaba, <strong>${currentUser.FirstName}</strong></span>
      ${currentUser.IsAdmin == 1 ? '<a href="admin_panel.html" class="nav-btn" style="color:var(--accent);border-color:var(--accent);">⚙️ Admin Paneli</a>' : ''}
      <button class="nav-btn" onclick="doLogout()">Çıkış</button>`;
    if (favNavBtn) favNavBtn.classList.remove('fav-hidden');
  } else {
    area.innerHTML = `
      <button class="nav-btn" onclick="openAuth('login')">Giriş Yap</button>
      <button class="nav-btn accent" onclick="openAuth('register')">Kayıt Ol</button>`;
    if (favNavBtn) favNavBtn.classList.add('fav-hidden');
    closeFavSection();
  }
}
// ── DATA LOADING ──────────────────────────────────────────────────────────────
async function loadRecommendations() {
  try {
    const res  = await fetch(BASE + 'recommendations.php');
    const data = await res.json();
    if (data.status === 'success') {
      allData = data.data;
      document.getElementById('section-heading').style.display = '';
      applyClientFilter();
    } else {
      showEmpty('Veriler yüklenemedi.', data.message || '');
    }
  } catch (e) {
    showEmpty('Backend bağlantısı kurulamadı.', 'PHP sunucusunun çalıştığından emin olun.');
  }
}

async function fetchSearch() {
  const q   = document.getElementById('search-input').value.trim();
  const cat = document.querySelector('.filter-btn.active')?.dataset.cat || 'all';

  if (!q) { loadRecommendations(); return; }

  try {
    const url  = `${BASE}search.php?q=${encodeURIComponent(q)}&cat=${cat}`;
    const res  = await fetch(url);
    const data = await res.json();
    if (data.status === 'success') {
      allData = data.data;
      document.getElementById('section-heading').style.display = 'none';
      applyClientFilter();
    }
  } catch (_) {}
}

async function loadFavorites() {
  try {
    const res  = await fetch(BASE + 'get_favorites.php');
    const data = await res.json();
    if (data.status === 'success') {
      favSet = new Set(data.data.map(f => f.MenuID));
      updateFavNavBadge();
      renderGrid();
    }
  } catch (_) {}
}

// ── FILTERING & SORTING (client-side) ────────────────────────────────────────
function applyClientFilter() {
  const cat  = document.querySelector('.filter-btn.active')?.dataset.cat || 'all';
  const sort = document.getElementById('sort-select').value;

  let filtered = allData.filter(r => cat === 'all' || r.cat === cat);

  filtered.sort((a, b) => {
    if (sort === 'rating')     return b.rating   - a.rating;
    if (sort === 'price-asc')  return a.price    - b.price;
    if (sort === 'price-desc') return b.price    - a.price;
    if (sort === 'reviews')    return b.reviews  - a.reviews;
    if (sort === 'dist')       return (a.dist||9) - (b.dist||9);
    return 0;
  });

  currentData = filtered;
  renderGrid();
}

// ── RENDER ────────────────────────────────────────────────────────────────────
function renderGrid() {
  const grid  = document.getElementById('grid');
  const count = document.getElementById('count');
  if (!currentData.length) {
    grid.innerHTML = `<div class="empty"><div class="empty-icon">🔍</div><h3>Sonuç bulunamadı</h3><p>Farklı bir arama terimi ya da kategori deneyin.</p></div>`;
    count.textContent = '0';
    return;
  }
  grid.innerHTML = currentData.map((r, i) => renderCard(r, i)).join('');
  count.textContent = currentData.length;
}

function renderCard(r, i) {
  const isFav = favSet.has(r.id);
  return `
  <div class="card" style="animation-delay:${i * 0.04}s" onclick="openDetail(${r.id})">
    <div class="card-img">
      ${r.img ? `<img src="${r.img}" alt="${r.name}" loading="lazy">` : `<div class="card-img-placeholder">${r.emoji}</div>`}
      <span class="card-badge ${r.cat}">${badgeLabel(r.cat)}</span>
      <div class="card-fav ${isFav ? 'active' : ''}" onclick="toggleFav(event, ${r.id})">
        <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
      </div>
    </div>
    <div class="card-body">
      <div class="card-top">
        <div class="card-name">${r.name}</div>
        <div class="card-rating">${ratingStars(r.rating)}<span class="rating-num">${r.rating}</span></div>
      </div>
      <div class="card-meta">
        <span class="card-cuisine">${r.cuisine}</span>
        <span class="sep">·</span>
        <span class="card-reviews">${(r.reviews||0).toLocaleString('tr-TR')} yorum</span>
      </div>
      <div class="card-tags">${(r.tags||[]).slice(0,3).map(t => `<span class="tag">${t}</span>`).join('')}</div>
      <div class="card-footer">
        <div class="card-price">
          <span class="price-range">${priceStars(r.price)}</span>
          <span class="price-label">&nbsp;${r.priceLabel}</span>
        </div>
        <div style="display:flex;align-items:center;gap:8px;">
          ${r.open ? `<span class="open-badge">Açık</span>` : `<span class="closed-badge">Kapalı</span>`}
          ${r.dist ? `<div class="card-dist"><svg viewBox="0 0 24 24"><circle cx="12" cy="10" r="3"/><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z"/></svg>${r.dist} km</div>` : ''}
        </div>
      </div>
    </div>
  </div>`;
}

function showEmpty(title, msg) {
  document.getElementById('grid').innerHTML = `<div class="empty"><div class="empty-icon">⚠️</div><h3>${title}</h3><p>${msg}</p></div>`;
  document.getElementById('count').textContent = '0';
}

// ── DETAIL MODAL ──────────────────────────────────────────────────────────────
async function openDetail(id) {
  const r = currentData.find(d => d.id === id) || allData.find(d => d.id === id);
  if (!r) return;

  const isFav = favSet.has(id);

  document.getElementById('modal-inner').innerHTML = `
    ${r.img ? `<img class="modal-img" src="${r.img}" alt="${r.name}">` : `<div class="modal-img-ph">${r.emoji}</div>`}
    <div class="modal-content">
      <div class="modal-header">
        <h2>${r.name}</h2>
        <div class="modal-meta">
          ${ratingStars(r.rating)}
          <span class="rating-num">${r.rating}</span>
          <span style="font-size:13px;color:var(--text3)">(${(r.reviews||0).toLocaleString('tr-TR')} yorum)</span>
          ${r.open ? `<span class="open-badge">Açık</span>` : `<span class="closed-badge">Kapalı</span>`}
        </div>
      </div>
      <div class="modal-meta" style="gap:16px;margin-bottom:4px;">
        <span style="font-size:13px;color:var(--text3)">${r.cuisine}</span>
        <span style="font-size:13px;color:var(--text3)"><b style="font-weight:400;color:var(--text2)">${r.priceLabel}</b>${r.dist ? ` &nbsp;·&nbsp; ${r.dist} km uzakta` : ''}</span>
      </div>
      ${r.desc ? `<div class="modal-section"><div class="modal-section-title">Hakkında</div><p class="modal-desc">${r.desc}</p></div>` : ''}
      <div class="modal-section">
        <div class="modal-section-title">Etiketler</div>
        <div class="modal-tags">${(r.tags||[]).map(t => `<span class="tag">${t}</span>`).join('')}</div>
      </div>
      ${r.hours && r.hours[0] ? `
      <div class="modal-section">
        <div class="modal-section-title">Çalışma Saatleri</div>
        <div class="modal-hours">${r.hours.filter(Boolean).map(h => `<span>${h}</span>`).join('')}</div>
      </div>` : ''}
      <div class="modal-section" id="reviews-section">
        <div class="modal-section-title" style="display:flex;justify-content:space-between;align-items:center;">
          <span>Yorumlar</span>
          ${currentUser ? `<button class="btn-sm" onclick="openReviewModal(${id}, '${r.name.replace(/'/g,"\\'")}')">+ Yorum Yaz</button>` : `<button class="btn-sm" onclick="openAuth('login')">Giriş Yap & Yorum Yaz</button>`}
        </div>
        <div id="review-list-content"><p class="review-empty">Yükleniyor…</p></div>
      </div>
      <div class="modal-actions">
        <button class="btn-secondary" onclick="toggleFavDetail(${id})" id="fav-btn-detail">
          ${isFav ? '💛 Favorilerde' : '🤍 Favorilere Ekle'}
        </button>
      </div>
    </div>`;

  document.getElementById('detail-overlay').classList.add('open');
  loadReviews(id);
}

async function loadReviews(menuId) {
  const box = document.getElementById('review-list-content');
  if (!box) return;
  if (!currentUser) { box.innerHTML = `<p class="review-empty">Yorumları görmek için giriş yapın.</p>`; return; }
  try {
    const res  = await fetch(`${BASE}get_reviews.php?MenuID=${menuId}`);
    const data = await res.json();
    if (data.status === 'success' && data.data.length) {
      box.innerHTML = `<div class="review-list">${data.data.map(rv => `
        <div class="review-item">
          <div class="review-header">
            <span class="review-author">${rv.FirstName} ${rv.LastName}</span>
            <div style="display:flex;align-items:center;gap:6px;">
              ${ratingStars(rv.Rating)}
              <span class="review-date">${new Date(rv.Date).toLocaleDateString('tr-TR')}</span>
            </div>
          </div>
          <p class="review-text">${rv.Text || ''}</p>
        </div>`).join('')}</div>`;
    } else {
      box.innerHTML = `<p class="review-empty">Henüz yorum yok. İlk yorumu sen yaz!</p>`;
    }
  } catch (_) {
    box.innerHTML = `<p class="review-empty">Yorumlar yüklenemedi.</p>`;
  }
}

// ── REVIEW MODAL ──────────────────────────────────────────────────────────────
function openReviewModal(menuId, name) {
  activeMenuId = menuId;
  selectedRating = 0;
  document.getElementById('review-item-name').textContent = name;
  document.getElementById('review-text').value = '';
  document.getElementById('review-msg').textContent = '';
  document.getElementById('star-picker').querySelectorAll('span').forEach(s => s.classList.remove('lit'));
  document.getElementById('review-overlay').classList.add('open');
}

function closeReviewModal() {
  document.getElementById('review-overlay').classList.remove('open');
  activeMenuId = null;
}

async function submitReview() {
  const text = document.getElementById('review-text').value.trim();
  const msg  = document.getElementById('review-msg');

  if (!selectedRating) { setMsg(msg, 'Lütfen bir puan seçin.', false); return; }
  if (!text)           { setMsg(msg, 'Lütfen bir yorum yazın.', false); return; }

  const fd = new FormData();
  fd.append('MenuID', activeMenuId);
  fd.append('Text',   text);
  fd.append('Rating', selectedRating);

  try {
    const res  = await fetch(BASE + 'add_review.php', { method: 'POST', body: fd });
    const data = await res.json();
    if (data.status === 'success') {
      setMsg(msg, '✓ Yorumunuz kaydedildi.', true);
      setTimeout(() => {
        closeReviewModal();
        loadReviews(activeMenuId);
        loadRecommendations(); // refresh ratings
      }, 1200);
    } else {
      setMsg(msg, data.message, false);
    }
  } catch (_) {
    setMsg(msg, 'Bağlantı hatası.', false);
  }
}

// ── FAVORITES ─────────────────────────────────────────────────────────────────
async function toggleFav(e, id) {
  e.stopPropagation();
  if (!currentUser) { openAuth('login'); return; }

  const fd = new FormData();
  fd.append('MenuID', id);
  try {
    const res  = await fetch(BASE + 'toggle_favorite.php', { method: 'POST', body: fd });
    const data = await res.json();
    if (data.status === 'success') {
      if (data.action === 'added') favSet.add(id); else favSet.delete(id);
      updateFavNavBadge();
      if (favSectionOpen) renderFavSection();
        else renderGrid();
    }
  } catch (_) {}
}

async function toggleFavDetail(id) {
  if (!currentUser) { openAuth('login'); return; }
  const fd = new FormData();
  fd.append('MenuID', id);
  try {
    const res  = await fetch(BASE + 'toggle_favorite.php', { method: 'POST', body: fd });
    const data = await res.json();
    if (data.status === 'success') {
      if (data.action === 'added') favSet.add(id); else favSet.delete(id);
      const btn = document.getElementById('fav-btn-detail');
      if (btn) btn.textContent = favSet.has(id) ? '💛 Favorilerde' : '🤍 Favorilere Ekle';
      updateFavNavBadge();
if (favSectionOpen) renderFavSection();
      renderGrid();
    }
  } catch (_) {}
}

// ── AUTH ──────────────────────────────────────────────────────────────────────
function openAuth(tab = 'login') {
  document.querySelectorAll('.auth-tab').forEach(t => {
    t.classList.toggle('active', t.dataset.tab === tab);
  });
  document.getElementById('form-login').style.display    = tab === 'login'    ? '' : 'none';
  document.getElementById('form-register').style.display = tab === 'register' ? '' : 'none';
  document.getElementById('auth-overlay').classList.add('open');
}

async function doLogin() {
  const email = document.getElementById('login-email').value.trim();
  const pass  = document.getElementById('login-pass').value;
  const msg   = document.getElementById('login-msg');
  if (!email || !pass) { setMsg(msg, 'Lütfen tüm alanları doldurun.', false); return; }

  const fd = new FormData();
  fd.append('EmailAddress', email);
  fd.append('Password', pass);

  try {
    const res  = await fetch(BASE + 'login.php', { method: 'POST', body: fd });
    const data = await res.json();
    if (data.status === 'success') {
      currentUser = data.user;
      setMsg(msg, '✓ Giriş başarılı!', true);
      setTimeout(() => { closeOverlay('auth-overlay'); renderAuthArea(); loadFavorites(); }, 800);
    } else {
      setMsg(msg, data.message, false);
    }
  } catch (_) {
    setMsg(msg, 'Bağlantı hatası.', false);
  }
}

async function doRegister() {
  const fn    = document.getElementById('reg-fname').value.trim();
  const ln    = document.getElementById('reg-lname').value.trim();
  const email = document.getElementById('reg-email').value.trim();
  const pass  = document.getElementById('reg-pass').value;
  const msg   = document.getElementById('reg-msg');

  if (!fn || !ln || !email || !pass) { setMsg(msg, 'Lütfen tüm alanları doldurun.', false); return; }

  const fd = new FormData();
  fd.append('FirstName',    fn);
  fd.append('LastName',     ln);
  fd.append('EmailAddress', email);
  fd.append('Password',     pass);

  try {
    const res  = await fetch(BASE + 'register.php', { method: 'POST', body: fd });
    const data = await res.json();
    if (data.status === 'success') {
      setMsg(msg, '✓ Kayıt başarılı! Giriş yapabilirsiniz.', true);
      setTimeout(() => {
        document.querySelector('.auth-tab[data-tab="login"]').click();
      }, 1200);
    } else {
      setMsg(msg, data.message, false);
    }
  } catch (_) {
    setMsg(msg, 'Bağlantı hatası.', false);
  }
}

async function doLogout() {
  try { await fetch(BASE + 'logout.php'); } catch (_) {}
  currentUser = null;
  favSet.clear();
  closeFavSection();
  renderAuthArea();
  renderGrid();
}

// ── GEOLOCATION ───────────────────────────────────────────────────────────────
function tryGeolocation() {
  if (!navigator.geolocation) return;
  navigator.geolocation.getCurrentPosition(
    pos => {
      document.getElementById('loc-text').textContent =
        `${pos.coords.latitude.toFixed(4)}, ${pos.coords.longitude.toFixed(4)} — Yakındaki mekanlar gösteriliyor`;
      document.getElementById('loc-banner').classList.add('visible');
      document.getElementById('sort-select').value = 'dist';
      applyClientFilter();
    },
    () => {
      document.getElementById('loc-text').textContent = 'Konum alınamadı — Gösterilen uzaklıklar tahminidir';
      document.getElementById('loc-banner').classList.add('visible');
    }
  );
}

// ── HELPERS ───────────────────────────────────────────────────────────────────
function closeOverlay(id) { document.getElementById(id).classList.remove('open'); }

function setMsg(el, text, ok) {
  el.textContent = text;
  el.className = 'form-msg ' + (ok ? 'ok' : 'err');
}

function badgeLabel(cat) {
  return { food: '🍽 Yiyecek', dessert: '🍰 Tatlı', drink: '☕ İçecek' }[cat] || cat;
}

function priceStars(price, max = 3) {
  let html = '<span class="pr">';
  for (let i = 1; i <= max; i++) html += `<span class="${i <= price ? '' : 'dim'}">₺</span>`;
  return html + '</span>';
}

function ratingStars(r) {
  const full = Math.floor(r);
  const half = (r % 1) >= 0.5;
  let html = '<span class="stars">';
  for (let i = 1; i <= 5; i++) {
    if (i <= full)               html += starSvg('full');
    else if (i === full+1 && half) html += starSvg('half');
    else                         html += starSvg('empty');
  }
  return html + '</span>';
}

function starSvg(type) {
  if (type === 'full')
    return `<svg class="star" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>`;
  if (type === 'half')
    return `<svg class="star half" viewBox="0 0 24 24"><defs><linearGradient id="hg"><stop offset="50%" stop-color="var(--accent)"/><stop offset="50%" stop-color="transparent"/></linearGradient></defs><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" fill="url(#hg)" stroke="var(--accent)"/></svg>`;
  return `<svg class="star empty" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>`;
}

// ── FAV SECTION ───────────────────────────────────────────────────────────────
let favSectionOpen = false;

function toggleFavSection() {
  favSectionOpen ? closeFavSection() : openFavSection();
}

function openFavSection() {
  favSectionOpen = true;
  document.getElementById('fav-section').classList.remove('fav-hidden');
  document.getElementById('fav-nav-btn').classList.add('active');
  renderFavSection();
}

function closeFavSection() {
  favSectionOpen = false;
  document.getElementById('fav-section').classList.add('fav-hidden');
  const btn = document.getElementById('fav-nav-btn');
  if (btn) btn.classList.remove('active');
}

async function renderFavSection() {
  const grid  = document.getElementById('fav-grid');
  const empty = document.getElementById('fav-empty');
  const count = document.getElementById('fav-section-count');

  try {
    const res  = await fetch(BASE + 'get_favorites.php');
    const data = await res.json();

    if (data.status === 'success' && data.data.length) {
      favSet = new Set(data.data.map(f => f.MenuID));
      const favItems = data.data.map(f =>
        allData.find(d => d.id === f.MenuID) || {
          id: f.MenuID,
          name: f.PlaceName + ' — ' + f.FoodName,
          cat: 'food', cuisine: '', rating: parseFloat(f.Rating) || 0,
          reviews: 0, price: 1, priceLabel: '₺', open: true,
          emoji: '🍽️', tags: [], desc: '', hours: [], img: null
        }
      );
      grid.innerHTML   = favItems.map((r, i) => renderCard(r, i)).join('');
      count.textContent = favItems.length + ' ürün';
      grid.classList.remove('fav-hidden');
      empty.classList.add('fav-hidden');
    } else {
      grid.classList.add('fav-hidden');
      empty.classList.remove('fav-hidden');
      count.textContent = '';
    }
  } catch (_) {
    grid.classList.add('fav-hidden');
    empty.classList.remove('fav-hidden');
  }
}

function updateFavNavBadge() {
  const badge = document.getElementById('fav-nav-count');
  if (!badge) return;
  const n = favSet.size;
  badge.textContent = n;
  badge.classList.toggle('visible', n > 0);
}
