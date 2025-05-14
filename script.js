document.addEventListener("DOMContentLoaded", function () {
  // === Menu toggle ===
  const toggleBtn = document.getElementById("menu-toggle");
  const sideMenu = document.getElementById("side-menu");
  const closeBtn = document.getElementById("close-btn");

  toggleBtn?.addEventListener("click", function (event) {
    event.stopPropagation();
    sideMenu?.classList.toggle("active");
  });

  closeBtn?.addEventListener("click", function (event) {
    event.stopPropagation();
    sideMenu?.classList.remove("active");
  });

  // Ne pas fermer si on clique à l'intérieur du menu
  sideMenu?.addEventListener("click", function (event) {
    event.stopPropagation();
  });

  // Fermer si on clique en dehors du menu
  document.addEventListener("click", function (event) {
    const isClickInside = sideMenu?.contains(event.target);
    const isClickOnToggle = toggleBtn?.contains(event.target);

    if (!isClickInside && !isClickOnToggle) {
      sideMenu?.classList.remove("active");
    }
  });

  // === Slider automatique ===
  let slides = document.querySelectorAll(".slide");
  let index = 0;

  if (slides.length > 0) {
    slides[0].classList.add("active"); // Afficher la première slide

    function showNextSlide() {
      slides[index].classList.remove("active");
      index = (index + 1) % slides.length;
      slides[index].classList.add("active");
    }

    setInterval(showNextSlide, 4000);
  }

  // === Initialisation du panier ===
  let cart = JSON.parse(localStorage.getItem("cart")) || [];

  const cartIcon = document.getElementById("panier-icon");
  const cartContent = document.getElementById("panier-content");
  const cartItems = document.getElementById("cart-items");
  const cartTotal = document.getElementById("cart-total");
  const cartCount = document.querySelector(".cart-count");

  // Ouvrir / fermer le panier
  cartIcon?.addEventListener("click", () => {
    cartContent.style.display = cartContent.style.display === "block" ? "none" : "block";
  });

  // Mettre à jour l’affichage du panier
  function updateCartDisplay() {
    cartItems.innerHTML = "";
    let total = 0;

    cart.forEach((item, index) => {
      const li = document.createElement("li");
      li.innerHTML = `
        <img src="${item.img}" alt="${item.name}" width="50">
        <div>
          <p>${item.name}</p>
          <p>${item.price}F</p>
        </div>
        <button class="remove-btn" data-index="${index}">Supprimer</button>
      `;
      cartItems.appendChild(li);
      total += item.price;
    });

    cartTotal.textContent = total.toFixed(2) + "F";
    cartCount.textContent = cart.length;

    // Bouton Supprimer
    document.querySelectorAll(".remove-btn").forEach(button => {
      button.addEventListener("click", function () {
        const index = this.getAttribute("data-index");
        cart.splice(index, 1);
        localStorage.setItem("cart", JSON.stringify(cart));
        updateCartDisplay();
      });
    });
  }

  // Au chargement
  updateCartDisplay();
});


