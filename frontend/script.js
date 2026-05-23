const DATA = [
  {
    id: 1, name: "Boğaz Ocakbaşı", cat: "food", cuisine: "Türk Izgara",
    rating: 4.8, reviews: 1240, price: 2, priceLabel: "₺₺",
    dist: 0.4, open: true, emoji: "🥩",
    tags: ["Izgara", "Deniz Ürünleri", "Alkollü"],
    desc: "Boğaz manzaralı eşsiz bir lokanta deneyimi. Ahşap dekorlu, samimi bir atmosferde en taze ızgara lezzetleri.",
    hours: ["Pts–Prş", "12:00–23:00", "Cum–Pzr", "12:00–00:30"],
    img: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600&q=80"
  },
  {
    id: 2, name: "Café Meltem", cat: "drink", cuisine: "Kahve & Brunch",
    rating: 4.6, reviews: 876, price: 1, priceLabel: "₺",
    dist: 0.7, open: true, emoji: "☕",
    tags: ["Specialty Coffee", "Brunch", "Vegan"],
    desc: "Çekirdekten çekilen specialty kahveler ve taze yapılan brunch menüsü. Minimalist tasarımı ve samimi ekibiyle şehrin en sevilen köşelerinden.",
    hours: ["Her gün", "08:00–22:00", "", ""],
    img: "https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=600&q=80"
  },
  {
    id: 3, name: "Tatlım Patisserie", cat: "dessert", cuisine: "Pastane",
    rating: 4.9, reviews: 2100, price: 2, priceLabel: "₺₺",
    dist: 1.1, open: true, emoji: "🍰",
    tags: ["Fransız Pastası", "Çikolata", "Paket Servis"],
    desc: "Paris'te eğitim almış pasta şefi tarafından hazırlanan el yapımı Fransız pastalıkları. Her sabah taze.",
    hours: ["Pts–Cmt", "09:00–21:00", "Paz", "10:00–19:00"],
    img: "https://images.unsplash.com/photo-1464305795204-6f5bbfc7fb81?w=600&q=80"
  },
  {
    id: 4, name: "Çınar Balık", cat: "food", cuisine: "Balık & Deniz Ürünleri",
    rating: 4.5, reviews: 643, price: 3, priceLabel: "₺₺₺",
    dist: 2.3, open: false, emoji: "🐟",
    tags: ["Balık", "Meze", "Rezervasyon"],
    desc: "Günlük taze balık ile hazırlanan Ege ve Karadeniz mutfağı. Geniş meze çeşitleri ve özel şarap seçkisi.",
    hours: ["Salı–Paz", "11:30–23:30", "Pts", "Kapalı"],
    img: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=600&q=80"
  },
  {
    id: 5, name: "Mado", cat: "dessert", cuisine: "Dondurma & Tatlı",
    rating: 4.3, reviews: 3400, price: 1, priceLabel: "₺",
    dist: 0.3, open: true, emoji: "🍦",
    tags: ["Maraş Dondurması", "Baklava", "Künefe"],
    desc: "Geleneksel Maraş dondurması ve Türk tatlılarında 70 yıllık deneyim. Aile dostu ortam.",
    hours: ["Her gün", "10:00–23:00", "", ""],
    img: "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=600&q=80"
  },
  {
    id: 6, name: "Nook Bistro", cat: "food", cuisine: "Akdeniz Füzyon",
    rating: 4.7, reviews: 512, price: 3, priceLabel: "₺₺₺",
    dist: 1.8, open: true, emoji: "🥗",
    tags: ["Vegan Dostu", "Rezervasyon", "Şarap Listesi"],
    desc: "Akdeniz mutfağını Asya dokunuşlarıyla harmanlayan yaratıcı ve mevsimsel menü. Huzurlu bahçe terası.",
    hours: ["Pts–Cmt", "18:00–00:00", "Paz", "12:00–22:00"],
    img: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600&q=80"
  },
  {
    id: 7, name: "Kahve Dedektifi", cat: "drink", cuisine: "Specialty Kahve",
    rating: 4.8, reviews: 220, price: 1, priceLabel: "₺",
    dist: 0.9, open: true, emoji: "🔍",
    tags: ["Pour Over", "Cold Brew", "Çalışma Ortamı"],
    desc: "Küçük ama güçlü. Dünya genelinden seçilmiş tek köken çekirdeklerle hazırlanan ekstraksiyon odaklı kahveler.",
    hours: ["Her gün", "07:30–21:00", "", ""],
    img: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600&q=80"
  },
  {
    id: 8, name: "Serpme Kahvaltı Evi", cat: "food", cuisine: "Kahvaltı",
    rating: 4.6, reviews: 1890, price: 2, priceLabel: "₺₺",
    dist: 3.2, open: false, emoji: "🍳",
    tags: ["Köy Ürünleri", "Serpme", "Organik"],
    desc: "Karadeniz köylerinden getirilen organik ürünlerle hazırlanan zengin geleneksel Türk kahvaltısı.",
    hours: ["Her gün", "08:00–15:00", "", ""],
    img: "https://images.unsplash.com/photo-1533089860892-a7c6f0a88666?w=600&q=80"
  },
  {
    id: 9, name: "Çikolata Atölyesi", cat: "dessert", cuisine: "Çikolatacı",
    rating: 4.7, reviews: 430, price: 2, priceLabel: "₺₺",
    dist: 1.5, open: true, emoji: "🍫",
    tags: ["El Yapımı", "Sipariş Üzerine", "Hediye"],
    desc: "Bean-to-bar anlayışıyla üretilen el yapımı çikolatalar ve özel sipariş hediyelikler. Tadım turları mevcut.",
    hours: ["Pts–Cmt", "10:00–20:00", "Paz", "12:00–18:00"],
    img: "https://images.unsplash.com/photo-1542826438-bd32f43d626f?w=600&q=80"
  }
];

let favs = new Set();
let currentData = [...DATA];

function priceStars(price, max=3) {
  let html = '<span class="pr">';
  for(let i=1; i<=max; i++) {
    html += `<span class="${i<=price?'':'dim'}">₺</span>`;
  }
  return html + '</span>';
}

function ratingStars(r) {
  let html = '<span class="stars">';
  const full = Math.floor(r);
  const half = r % 1 >= 0.5;
  for(let i=1; i<=5; i++) {
    if(i<=full) html += starSvg('full');
    else if(i===full+1 && half) html += starSvg('half');
    else html += starSvg('empty');
  }
  return html + '</span>';
}

function starSvg(type) {
  if(type==='full') return `<svg class="star" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>`;
  if(type==='half') return `<svg class="star half" viewBox="0 0 24 24"><defs><linearGradient id="hg"><stop offset="50%" stop-color="var(--accent)"/><stop offset="50%" stop-color="transparent"/></linearGradient></defs><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" fill="url(#hg)" stroke="var(--accent)"/></svg>`;
  return `<svg class="star empty" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>`;
}

function badgeClass(cat) {
  if(cat==='food') return 'food';
  if(cat==='dessert') return 'dessert';
  if(cat==='drink') return 'drink';
  return '';
}
function badgeLabel(cat) {
  if(cat==='food') return '🍽 Yiyecek';
  if(cat==='dessert') return '🍰 Tatlı';
  if(cat==='drink') return '☕ İçecek';
  return cat;
}

function renderCard(r, i) {
  const isFav = favs.has(r.id);
  return `
  <div class="card" style="animation-delay:${i*0.05}s" onclick="openModal(${r.id})">
    <div class="card-img">
      ${r.img
        ? `<img src="${r.img}" alt="${r.name}" loading="lazy">`
        : `<div class="card-img-placeholder">${r.emoji}</div>`}
      <span class="card-badge ${badgeClass(r.cat)}">${badgeLabel(r.cat)}</span>
      <div class="card-fav ${isFav?'active':''}" onclick="toggleFav(event,${r.id})">
        <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
      </div>
    </div>
    <div class="card-body">
      <div class="card-top">
        <div class="card-name">${r.name}</div>
        <div class="card-rating">
          ${ratingStars(r.rating)}
          <span class="rating-num">${r.rating}</span>
        </div>
      </div>
      <div class="card-meta">
        <span class="card-cuisine">${r.cuisine}</span>
        <span class="sep">·</span>
        <span class="card-reviews">${r.reviews.toLocaleString('tr-TR')} yorum</span>
      </div>
      <div class="card-tags">
        ${r.tags.slice(0,3).map(t=>`<span class="tag">${t}</span>`).join('')}
      </div>
      <div class="card-footer">
        <div class="card-price">
          <span class="price-range">${priceStars(r.price)}</span>
          <span class="price-label">&nbsp;${r.priceLabel}</span>
        </div>
        <div style="display:flex;align-items:center;gap:8px;">
          ${r.open
            ? `<span class="open-badge">Açık</span>`
            : `<span class="closed-badge">Kapalı</span>`}
          <div class="card-dist">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="10" r="3"/><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z"/></svg>
            ${r.dist} km
          </div>
        </div>
      </div>
    </div>
  </div>`;
}

function renderGrid() {
  const grid = document.getElementById('grid');
  const count = document.getElementById('count');
  if(currentData.length===0) {
    grid.innerHTML = `<div class="empty"><div class="empty-icon">🔍</div><h3>Sonuç bulunamadı</h3><p>Farklı bir arama terimi ya da kategori deneyin.</p></div>`;
    count.textContent = '0';
    return;
  }
  grid.innerHTML = currentData.map((r,i)=>renderCard(r,i)).join('');
  count.textContent = currentData.length;
}

function applyFilters() {
  const cat = document.querySelector('.filter-btn.active')?.dataset.cat || 'all';
  const sort = document.getElementById('sort-select').value;
  const q = document.getElementById('search-input').value.trim().toLowerCase();

  let filtered = DATA.filter(r => {
    if(cat!=='all' && r.cat!==cat) return false;
    if(q && !r.name.toLowerCase().includes(q) && !r.cuisine.toLowerCase().includes(q) && !r.tags.join(' ').toLowerCase().includes(q)) return false;
    return true;
  });

  filtered.sort((a,b) => {
    if(sort==='rating') return b.rating-a.rating;
    if(sort==='price-asc') return a.price-b.price;
    if(sort==='price-desc') return b.price-a.price;
    if(sort==='reviews') return b.reviews-a.reviews;
    if(sort==='dist') return a.dist-b.dist;
    return 0;
  });

  currentData = filtered;
  renderGrid();
}

document.getElementById('cat-filters').addEventListener('click', e=>{
  const btn = e.target.closest('.filter-btn');
  if(!btn) return;
  document.querySelectorAll('.filter-btn').forEach(b=>b.classList.remove('active'));
  btn.classList.add('active');
  applyFilters();
});
document.getElementById('sort-select').addEventListener('change', applyFilters);
document.getElementById('search-input').addEventListener('input', applyFilters);

function toggleFav(e, id) {
  e.stopPropagation();
  if(favs.has(id)) favs.delete(id); else favs.add(id);
  renderGrid();
}

function openModal(id) {
  const r = DATA.find(d=>d.id===id);
  if(!r) return;
  const isFav = favs.has(r.id);
  document.getElementById('modal-inner').innerHTML = `
    ${r.img
      ? `<img class="modal-img" src="${r.img}" alt="${r.name}">`
      : `<div class="modal-img-ph">${r.emoji}</div>`}
    <div class="modal-content">
      <div class="modal-header">
        <h2>${r.name}</h2>
        <div class="modal-meta">
          ${ratingStars(r.rating)}
          <span class="rating-num">${r.rating}</span>
          <span style="font-size:13px;color:var(--text3)">(${r.reviews.toLocaleString('tr-TR')} yorum)</span>
          ${r.open?`<span class="open-badge">Açık</span>`:`<span class="closed-badge">Kapalı</span>`}
        </div>
      </div>
      <div class="modal-meta" style="gap:16px;margin-bottom:4px;">
        <span style="font-size:13px;color:var(--text3)">${r.cuisine}</span>
        <span style="font-size:13px;color:var(--text3)"><b style="font-weight:400;color:var(--text2)">${r.priceLabel}</b> &nbsp;·&nbsp; ${r.dist} km uzakta</span>
      </div>
      <div class="modal-section">
        <div class="modal-section-title">Hakkında</div>
        <p class="modal-desc">${r.desc}</p>
      </div>
      <div class="modal-section">
        <div class="modal-section-title">Etiketler</div>
        <div class="modal-tags">${r.tags.map(t=>`<span class="tag">${t}</span>`).join('')}</div>
      </div>
      ${r.hours[0]?`
      <div class="modal-section">
        <div class="modal-section-title">Çalışma Saatleri</div>
        <div class="modal-hours">
          ${r.hours.filter(Boolean).map(h=>`<span>${h}</span>`).join('')}
        </div>
      </div>`:''}
      <div class="modal-actions">
        <button class="btn-primary">🗺 Yol Tarifi Al</button>
        <button class="btn-secondary" onclick="toggleFavModal(${r.id})">
          ${isFav?'💛 Favorilerde':'🤍 Favorilere Ekle'}
        </button>
      </div>
    </div>`;
  document.getElementById('modal-overlay').classList.add('open');
}

function toggleFavModal(id) {
  if(favs.has(id)) favs.delete(id); else favs.add(id);
  openModal(id);
  renderGrid();
}

document.getElementById('modal-close').addEventListener('click', ()=>{
  document.getElementById('modal-overlay').classList.remove('open');
});
document.getElementById('modal-overlay').addEventListener('click', e=>{
  if(e.target===document.getElementById('modal-overlay'))
    document.getElementById('modal-overlay').classList.remove('open');
});
document.addEventListener('keydown', e=>{
  if(e.key==='Escape') document.getElementById('modal-overlay').classList.remove('open');
});

// Location
document.getElementById('loc-btn').addEventListener('click', ()=>{
  if(!navigator.geolocation) return;
  navigator.geolocation.getCurrentPosition(pos=>{
    const banner = document.getElementById('loc-banner');
    document.getElementById('loc-text').textContent = `${pos.coords.latitude.toFixed(4)}, ${pos.coords.longitude.toFixed(4)} — Yakındaki mekanlar gösteriliyor`;
    banner.classList.add('visible');
    document.getElementById('sort-select').value = 'dist';
    applyFilters();
  }, ()=>{
    const banner = document.getElementById('loc-banner');
    document.getElementById('loc-text').textContent = 'Konum alınamadı — Gösterilen uzaklıklar tahminidir';
    banner.classList.add('visible');
  });
});

// Init
applyFilters();