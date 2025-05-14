<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Habit</title>
  <link rel="stylesheet" href="style.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    .menu {
      display: flex;
      gap: 10px;
      padding: 10px;
      background-color: #f8f8f8;
    }

    .menu a {
      color: #000;
      font-size: 20px;
      text-decoration: none;
    }

    .menu1 {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px;
      background-color: #fff;
      border-bottom: 1px solid #ccc;
    }

    .menu1 img {
      height: 60px;
    }

    .panier {
      position: relative;
      cursor: pointer;
      font-size: 24px;
    }

    .cart-count {
      background-color: red;
      color: white;
      font-size: 12px;
      border-radius: 50%;
      padding: 2px 6px;
      position: absolute;
      top: -10px;
      right: -10px;
    }

    #panier-content {
      display: none;
      border: 1px solid #ccc;
      padding: 10px;
      background: #fff;
      position: absolute;
      top: 100px;
      right: 20px;
      width: 250px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      z-index: 999;
    }

    #panier-content .close-btn {
      font-size: 18px;
      position: absolute;
      top: 5px;
      right: 5px;
      cursor: pointer;
    }

    #cart-items li {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
      justify-content: space-between;
    }

    #cart-items img {
      width: 50px;
      height: 50px;
      margin-right: 10px;
    }

    .categories {
      padding: 30px;
      text-align: center;
    }

    .row {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
    }

    .col-3 {
      border: 1px solid #ddd;
      padding: 10px;
      width: 200px;
      border-radius: 8px;
      background-color: #fafafa;
    }

    .col-3 img {
      width: 100%;
      height: auto;
      border-radius: 6px;
    }

    .prix {
      font-size: 18px;
      font-weight: bold;
      margin: 10px 0;
    }

    .add-to-cart {
      display: inline-block;
      margin-top: 10px;
      color: #fff;
      background-color: #28a745;
      padding: 8px 12px;
      border-radius: 4px;
      text-decoration: none;
    }

    .add-to-cart:hover {
      background-color: #218838;
    }

    .remove-btn {
      background-color: #f44336;
      color: white;
      padding: 4px 8px;
      font-size: 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .remove-btn:hover {
      background-color: #d32f2f;
    }
  </style>
</head>
<body>
<!-- Message qui s'affiche après l'ajout d'un produit -->
<div id="message-ajout" style="display:none; position:fixed; top:20px; left:50%; transform:translateX(-50%); background-color:#28a745; color:white; padding:10px 20px; border-radius:5px; box-shadow:0 4px 6px rgba(0,0,0,0.1); z-index:1000;">
    Vous avez ajouté <span id="product-name"></span> au panier !
  </div>
  <div id="message-suppression" style="display: none; position:fixed; top:60px; left:50%; transform:translateX(-50%); background: #dff0d8; color: #3c763d; padding: 10px 20px; border-radius: 5px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); z-index:1000;">
   le produit a été supprimé <span id="product-name"></span> du panier !
  </div>
  
  
  
  <!-- Réseaux sociaux -->
  <div class="menu">
    <a href="#"><i class="fa fa-facebook"></i></a>
    <a href="#"><i class="fa fa-instagram"></i></a>
    <a href="#"><i class="fab fa-tiktok"></i></a>
  </div>

  <!-- Logo et panier -->
  <div class="menu1">
    <img src="images/logo.PNG" alt="Logo">
    <div class="panier" id="panier-icon">
      <i class="fa fa-shopping-cart" aria-hidden="true"></i>
      <span class="cart-count">0</span>
    </div>
  </div>

  <!-- Panier déroulant -->
  <div id="panier-content">
    <span class="close-btn" id="close-panier">×</span>
    <ul id="cart-items"></ul>
    <p>Total : <span id="cart-total">0.00€</span></p>
    <a href="commande.html" class="commander-btn">Commander</a>
  </div>

  <!-- Section catégories -->
  <section class="categories">
    <h2>Nos Collections</h2>
    <div class="premierpartie">
      <div class="row" id="product-list">
        <!-- Les produits vont être ajoutés ici par JavaScript -->
      </div>
    </div>
  </section>
  

  <section class="categories">
   
    <div class="premierpartie">
      <div class="row">
        <div class="col-3">
          <img src="images/boucle.jpg" alt="Boucles d’oreilles" class="product-img">
          <p class="prix">5€</p>
          <a href="#" class="add-to-cart" data-name="Boucles d’oreilles" data-price="5" data-img="images/boucle.jpg">Ajouter au panier →</a>
        </div>
        <div class="col-3">
          <img src="images/ord.jpg" alt="Ordinateur" class="product-img">
          <p class="prix">10€</p>
          <a href="#" class="add-to-cart" data-name="Ordinateur" data-price="10" data-img="images/ord.jpg">Ajouter au panier →</a>
        </div>
        <div class="col-3">
          <img src="images/chausure.jpg" alt="Chaussure" class="product-img">
          <p class="prix">7€</p>
          <a href="#" class="add-to-cart" data-name="Chaussure" data-price="7" data-img="images/chausure.jpg">Ajouter au panier →</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Script panier -->
<script>
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  const cartIcon = document.getElementById("panier-icon");
  const cartContent = document.getElementById("panier-content");
  const cartItems = document.getElementById("cart-items");
  const cartTotal = document.getElementById("cart-total");
  const cartCount = document.querySelector(".cart-count");
  const closeBtn = document.getElementById("close-panier");

  // Mettre à jour l'affichage du panier
  // Fonction pour mettre à jour l'affichage du panier
function updateCartDisplay() {
  cartItems.innerHTML = "";
  let total = 0;

  cart.forEach((item, index) => {
    const li = document.createElement("li");
    li.innerHTML = `
      <img src="${item.img}" alt="${item.name}" width="50">
      <div>
        <p>${item.name}</p>
        <p>${item.price}€</p>
      </div>
      <button class="remove-btn" data-index="${index}">Supprimer</button>
    `;
    cartItems.appendChild(li);
    total += item.price;
  });

  cartTotal.textContent = total.toFixed(2);
  cartCount.textContent = cart.length;

  // Ajouter l'événement de suppression des articles
 // Ajouter l'événement de suppression des articles
document.querySelectorAll(".remove-btn").forEach(button => {
  button.addEventListener("click", function (e) {
    e.stopPropagation();  // Empêche la propagation de l'événement de clic (qui fermerait le panier)
    const index = this.getAttribute("data-index");
    cart.splice(index, 1);
    localStorage.setItem("cart", JSON.stringify(cart));
    updateCartDisplay();

    // Afficher message temporaire
    const msg = document.getElementById("message-suppression");
    const productName = document.getElementById("product-name");
    productName.textContent = name;
    msg.style.display = "block";
    setTimeout(() => {
      msg.style.display = "none";
    }, 2000);
  });
});
}

// Ajouter au panier
document.querySelectorAll(".add-to-cart").forEach(button => {
  button.addEventListener("click", function (e) {
    e.preventDefault();
    const name = this.getAttribute("data-name");
    const price = parseFloat(this.getAttribute("data-price"));
    const img = this.getAttribute("data-img");

    cart.push({ name, price, img });
    localStorage.setItem("cart", JSON.stringify(cart));
    updateCartDisplay();

    // Afficher message temporaire
    const msg = document.getElementById("message-ajout");
    const productName = document.getElementById("product-name");
    productName.textContent = name;
    msg.style.display = "block";
    setTimeout(() => {
      msg.style.display = "none";
    }, 2000);
  });
});


// Toggle afficher/cacher le panier (ne pas refermer lors de la suppression)
cartIcon.addEventListener("click", () => {
  if (cartContent.style.display === "block") {
    cartContent.style.display = "none";
  } else {
    cartContent.style.display = "block";
  }
});

// Fermer le panier avec la croix
closeBtn.addEventListener("click", () => {
  cartContent.style.display = "none";
});

// Fermer le panier si un clic est effectué en dehors
document.addEventListener("click", function (e) {
  if (!cartContent.contains(e.target) && !cartIcon.contains(e.target)) {
    cartContent.style.display = "none";
  }
});
function afficherMessageSuppression(nomProduit) {
  const messageBox = document.getElementById("message-suppression");
  messageBox.textContent = `Vous avez supprimé le produit : ${nomProduit}`;
  messageBox.style.display = "block";

  // Disparition après 3 secondes
  setTimeout(() => {
    messageBox.style.display = "none";
  }, 3000);
}


// Initialisation au chargement
updateCartDisplay();

</script>
<script>
  const produits = [
    {
      img: 'images/boucle.jpg',
      alt: 'Boucles d’oreilles',
      prix: 5,
      nom: 'Boucles d’oreilles'
    },
    {
      img: 'images/ord.jpg',
      alt: 'Ordinateur',
      prix: 10,
      nom: 'Ordinateur'
    },
    {
      img: 'images/chausure.jpg',
      alt: 'Chaussure',
      prix: 7,
      nom: 'Chaussure'
    }
  ];
  
  const productList = document.getElementById('product-list');
  
  produits.forEach(produit => {
    const productDiv = document.createElement('div');
    productDiv.classList.add('col-3');
    productDiv.innerHTML = `
      <img src="${produit.img}" alt="${produit.alt}" class="product-img">
      <p class="prix">${produit.prix}€</p>
      <a href="#" class="add-to-cart" 
         data-name="${produit.nom}" 
         data-price="${produit.prix}" 
         data-img="${produit.img}">
         Ajouter au panier →
      </a>
    `;
    productList.appendChild(productDiv);
  });
  </script>
  
</body>
</html>
