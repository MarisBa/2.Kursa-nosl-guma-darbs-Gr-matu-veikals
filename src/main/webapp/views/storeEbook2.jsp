<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .main-content {
            padding: 20px;
            text-align: center;
        }
        .popular-books-slider {
            overflow: hidden;
            width: 100%;
            position: relative;
        }
        .popular-books {
            display: flex;
            transition: transform 1s ease; /* Adjust transition duration */
        }
        .book-card {
            flex: 0 0 auto;
            margin: 10px;
            width: 250px; /* Increase card width */
            height: 420px; /* Set a fixed height */
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .book-card a {
            text-decoration: none; /* Remove underline from anchor tags */
        }
        .book-card img {
            max-width: 100%;
            height: 300px; /* Set a fixed height */
        }
        .book-card h3 {
            margin-top: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #333; /* Dark grey */
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .book-card p {
            font-size: 12px;
            color: #777; /* Light grey */
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .slider-nav {
            margin-top: 20px;
            text-align: center;
        }
        .slider-nav button {
            background: none;
            border: none;
            color: #333;
            font-size: 24px;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s; /* Add transition */
        }
        .slider-nav button:hover {
            color: #fff; /* Change to white color */
            background-color: #555; /* Change to darker color */
        }
        .header-container {
            display: flex;
            align-items: center; /* Align items vertically */
            justify-content: center; /* Center items horizontally */
            padding: 20px;
            background-color: white; /* Add background color */
        }
    
        .logo {
            width: 20%;
            height: auto;
            margin-right: 200px;
        }
    
         .search-bar {
            display: flex;
            align-items: center;
        }
    
        .search-bar input[type="text"] {
            padding: 10px;
            width: calc(100% - 70px); /* Adjusted width to make room for the buttons */
            max-width: 600px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    
        .search-bar button {
            padding: 10px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
    
        .search-bar button:hover {
            background-color: #f0f0f0; /* Change to desired hover color */
        }
    
        .search-icon-button,
        .cart-icon-button {
            color: black;
        }
    
        .search-icon-button i,
        .cart-icon-button i {
            font-size: 1.5em; /* Adjust icon size */
        }
    
        .user-icon-button {
            padding: 10px; /* Adjust padding as needed */
            background-color: transparent;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 12px;
        }
    
        .user-icon-button:hover {
            background-color: #f0f0f0; /* Change to desired hover color */
        }
    
        .user-icon-button i {
            color: black;
            font-size: 1.5em; /* Adjust icon size */
        }

        /* Additional styles */
        .add-to-cart-button {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            align-self: center; /* Center the button horizontally */
        }

#cartModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto; /* Centered */
    padding: 20px;
    border-radius: 8px;
    width: 90%; /* Adjust width */
    max-width: 800px; /* Max width */
    height: 80%; /* Adjust height */
    max-height: 600px; /* Max height */
    overflow-y: auto; /* Add vertical scroll if needed */
}

.modal-content h2 {
    margin-top: 0;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

#cartControls {
    margin-top: 20px;
    text-align: center;
}

#decrementBtn, #incrementBtn {
    padding: 8px 16px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin: 0 5px;
}

#checkoutBtn {
    padding: 8px 16px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 10px;
}

#decrementBtn:hover, #incrementBtn:hover, #checkoutBtn:hover {
    background-color: #0056b3;
}

.modal-content {
/* Existing styles */
text-align: center; /* Center the content */
}

.modal-content ul {
padding: 0;
list-style-type: none;
}

.modal-content ul li {
display: flex;
align-items: center; /* Align items vertically */
justify-content: space-between; /* Space between title and button */
margin-bottom: 10px;
}

.modal-content ul li button {
padding: 5px 10px;
background-color: #dc3545; /* Red color for delete button */
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
transition: background-color 0.3s;
}

.modal-content ul li button:hover {
background-color: #c82333; /* Darker red on hover */
}
    </style>
    
</head>
<body>
    
    <div class="header-container">
        <img class="logo" src="https://cdn.shopify.com/s/files/1/0277/3830/8642/files/labrsbkstorelogo.jpg?height=628&pad_color=ffffff&v=1614777541&width=1200" alt="Logo">
        <div class="search-bar">
            <form action="/SearchServlet" method="get">
                <input type="text" name="query" placeholder="Search for books...">
                <button type="submit" class="search-icon-button"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <a href="#" class="cart-icon-button">
                <button type="button"><i class="fa-solid fa-cart-shopping"></i></button>
            </a>
            <a href="/Registration" class="user-icon-button"><i class="fa-regular fa-user"></i> Sign In</a>
        </div>
    </div>
    
    
    <div class="popular-books-slider">
        <div class="popular-books">
            <div class="book-card">
                <a href="/admin/book/2">
                    <img src="https://eglobuss.lv/storage/attachments/2y0/7ce/4bc/2y07ce4bcln23sbf34hfqpc73-350x500-resize-quality(85).webp" alt="Book Cover">
                    <p>TONY ROBBINS</p>
                    <h3>Life Force : How New Breakthroughs in Precision Medicine Can Transform the Quality of Your Life</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/5">
                    <img src="https://eglobuss.lv/storage/attachments/8qf/zag/jtc/8qfzagjtc4fdv65hiefqti9ak.jpg" alt="Book Cover">
                    <p>Gideon Defoe</p>
                    <h3>An Atlas of Extinct Countries</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/3">
                    <img src="https://image.ebooks.com/cover/210877223.jpg?width=166&height=250&quality=85" alt="Book Cover">
                    <p>STEVE BERRY</p>
                    <h3>The ATLAS MANUEVER</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/1">
                    <img src="https://assets-prd.ignimgs.com/2023/05/03/heidi-book-1683154826105.jpg?height=220" alt="Book Cover">
                    <p>JOHANNA SPYRI</p>
                    <h3>HEIDI</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/6">
                    <img src="https://eglobuss.lv/storage/attachments/bni/gpg/9o1/bnigpg9o12ap2guamq8g692so.jpg" alt="Book Cover">
                    <p>Morgan Housel</p>
                    <h3>Same as Ever : Timeless Lessons on Risk, Opportunity and Living a Good Life</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/7">
                    <img src="https://eglobuss.lv/storage/attachments/1pt/edi/jrk/1ptedijrk04t0sux3px5fxf5g.jpg" alt="Book Cover">
                    <p>Agatha Christie</p>
                    <h3>Partners in Crime : A Tommy & Tuppence Collection</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/4">
                    <img src="https://eglobuss.lv/storage/attachments/2xw/uhk/joh/2xwuhkjoh1zvzzhv8nlwapr7m.jpg" alt="Book Cover">
                    <p>Albert Moukheiber</p>
                    <h3>Your Brain Is Playing Tricks On You: How the Brain Shapes Opinions and Perceptions</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/8">
                    <img src="https://images.routledge.com/common/jackets/crclarge/978041592/9780415922227.jpg" alt="Book Cover">
                    <p>Jordan B. Peterson</p>
                    <h3>Maps of Meaning: The Architecture of Belief</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <div class="book-card">
                <a href="/admin/book/9">
                    <img src="https://eglobuss.lv/storage/attachments/5pd/gkx/79k/5pdgkx79kjvjzugezsxcfjclx.jpg" alt="Book Cover">
                    <p>Alexandre Samson</p>
                    <h3>Givenchy Catwalk : The Complete Collections</h3>
                    <button class="add-to-cart-button">Add to Cart</button>
                </a>
            </div>
            <!-- Add more book cards as needed -->
        </div>
        <div class="slider-nav">
            <button id="prevBtn" onclick="moveSlider(-1)">&#10094;</button>
            <button id="nextBtn" onclick="moveSlider(1)">&#10095;</button>
        </div>
    </div>

<!-- Cart Modal -->

<!-- Your existing HTML -->

<!-- Cart Modal -->
<div id="cartModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Your Cart</h2>
        <ul id="cartItems"></ul>
        <div id="cartControls">
            <button id="decrementBtn">-</button>
            <span id="quantity">1</span>
            <button id="incrementBtn">+</button>
            <button id="checkoutBtn">Checkout</button>
        </div>
    </div>
</div>

<script>
    // Cart object to store items
    const cart = [];

    // Function to add item to the cart
    function addToCart(bookTitle) {
        cart.push(bookTitle);
        updateCartUI();
    }

    // Function to remove item from the cart
    function removeFromCart(index) {
        cart.splice(index, 1);
        updateCartUI();
    }

    // Function to update the cart UI
    function updateCartUI() {
        const cartItemsElement = document.getElementById("cartItems");
        cartItemsElement.innerHTML = "";
        cart.forEach((item, index) => {
            const li = document.createElement("li");
            li.textContent = item;
            const deleteButton = document.createElement("button");
            deleteButton.textContent = "Delete";
            deleteButton.addEventListener("click", function() {
                removeFromCart(index);
            });
            li.appendChild(deleteButton);
            cartItemsElement.appendChild(li);
        });
    }

    // Event listener for Add to Cart buttons
    document.addEventListener("DOMContentLoaded", function () {
        const addToCartButtons = document.querySelectorAll(".add-to-cart-button");
        addToCartButtons.forEach(button => {
            button.addEventListener("click", function (event) {
                event.preventDefault(); // Prevent anchor tag's default behavior
                const bookTitle = this.parentElement.querySelector("h3").textContent;
                addToCart(bookTitle); // Add the book to cart
                alert("Added to cart!"); // Placeholder for demonstration
            });
        });

        // Event listener for opening and closing the cart modal
        const cartModal = document.getElementById("cartModal");
        const cartButton = document.querySelector(".cart-icon-button button");
        const closeModal = cartModal.querySelector(".close");
        cartButton.onclick = function() {
            cartModal.style.display = "block";
        }
        closeModal.onclick = function() {
            cartModal.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == cartModal) {
                cartModal.style.display = "none";
            }
        }
    });

    // Function to update quantity
    function updateQuantity(value) {
        const quantityElement = document.getElementById("quantity");
        const currentQuantity = parseInt(quantityElement.textContent);
        const newQuantity = currentQuantity + value;
        if (newQuantity >= 1) {
            quantityElement.textContent = newQuantity;
        }
    }

    // Event listener for increment and decrement buttons
    const decrementBtn = document.getElementById("decrementBtn");
    const incrementBtn = document.getElementById("incrementBtn");
    const checkoutBtn = document.getElementById("checkoutBtn");

    decrementBtn.addEventListener("click", function () {
        updateQuantity(-1);
    });

    incrementBtn.addEventListener("click", function () {
        updateQuantity(1);
    });

    // Event listener for checkout button
    checkoutBtn.addEventListener("click", function () {
        // Perform checkout process here
        alert("Checkout functionality is not implemented yet."); // Placeholder for demonstration
    });

    // Function to move slider
    function moveSlider(direction) {
        const slider = document.querySelector('.popular-books');
        const cardWidth = document.querySelector('.book-card').offsetWidth;
        slider.style.transition = 'transform 0.5s ease';
        if (direction === -1) {
            slider.style.transform = `translateX(${cardWidth}px)`;
            setTimeout(() => {
                slider.appendChild(slider.firstElementChild);
                slider.style.transition = 'none';
                slider.style.transform = 'translateX(0)';
            }, 500);
        } else if (direction === 1) {
            slider.style.transform = `translateX(-${cardWidth}px)`;
            setTimeout(() => {
                slider.prepend(slider.lastElementChild);
                slider.style.transition = 'none';
                slider.style.transform = 'translateX(0)';
            }, 500);
        }
    }


    // Function to add item to the cart
function addToCart(bookTitle) {
    // Check if the book is already in the cart
    if (!cart.includes(bookTitle)) {
        cart.push(bookTitle);
        updateCartUI();
    } else {
        alert("This book is already added to the cart.");
    }
}

</script>
</body>
</html>
