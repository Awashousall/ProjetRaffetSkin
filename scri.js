const menuOpenButton = document.querySelector("#menu-open-button");
const menuCloseButton = document.querySelector("#menu-close-button");
const navMenu = document.querySelector(".nav-menu");

menuOpenButton.addEventListener("click", () => {
  document.body.classList.toggle("show-mobile-menu");
});

menuCloseButton.addEventListener("click", () => {
  document.body.classList.remove("show-mobile-menu");
});

// Fonction pour fermer le menu si on clique/touche en dehors
function handleOutsideClick(event) {
  const isClickInsideMenu = navMenu.contains(event.target);
  const isClickOnOpenButton = menuOpenButton.contains(event.target);
  const isMenuOpen = document.body.classList.contains("show-mobile-menu");

  if (!isClickInsideMenu && !isClickOnOpenButton && isMenuOpen) {
    document.body.classList.remove("show-mobile-menu");
  }
}

document.addEventListener("touchstart", handleOutsideClick);
document.addEventListener("click", handleOutsideClick);




document.getElementById('menu-open-button').addEventListener('click', function() {
  document.querySelector('.menu').classList.toggle('open');
});

// Ajouter la classe pour ouvrir le menu
document.getElementById('menu-open-button').addEventListener('click', function() {
    document.body.classList.add('show-mobile-menu');
});

// Retirer la classe pour fermer le menu
document.getElementById('menu-close-button').addEventListener('click', function() {
    document.body.classList.remove('show-mobile-menu');
});

// Fonction pour ouvrir la modale avec l'image
function openModal(imageSrc) {
  const modal = document.getElementById('imageModal');
  const modalImage = document.getElementById('modalImage');
  modal.style.display = 'flex';
  modalImage.src = imageSrc;
  document.body.style.overflow = 'hidden'; // Empêche le scroll en arrière-plan
}

function closeModal() {
  const modal = document.getElementById('imageModal');
  modal.style.display = 'none';
  document.body.style.overflow = ''; // Rétablit le scroll
}

// Option : Fermer en cliquant en dehors de l'image
window.addEventListener('click', function(event) {
  const modal = document.getElementById('imageModal');
  if (event.target === modal) {
    closeModal();
  }
});
function openModal(imageSrc, price, name, imgPath) {
  const modal = document.getElementById('imageModal');
  const modalImage = document.getElementById('modalImage');
  const modalPrice = document.getElementById('modalPrice');
  const modalAddToCart = document.getElementById('modalAddToCart');

  modal.style.display = 'flex';
  modalImage.src = imageSrc;
  modalPrice.textContent = parseInt(price) + ' F';

  modalAddToCart.setAttribute('data-name', name);
  modalAddToCart.setAttribute('data-price', price);
  modalAddToCart.setAttribute('data-img', imgPath);

  document.body.style.overflow = 'hidden'; // Bloque le scroll en fond
}
