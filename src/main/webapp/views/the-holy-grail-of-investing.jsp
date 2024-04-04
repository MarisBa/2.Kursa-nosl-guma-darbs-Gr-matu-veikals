<!DOCTYPE html>
<html>
<head>
    <title>The Holy Grail of Investing</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* CSS for styling the book page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            padding-top: 10px;
            padding: 20px;
        }
        .image {
            flex: 1;
            text-align: left; /* Align the image to the right */
        }
        .image img {
            padding-left: 250px;
            padding-top: 200px;
            width: 70%; 
            height: auto;
            display: block; /* Make sure the image is displayed as a block element */
            margin: 0 auto; /* Center the image horizontally */
            padding-bottom: 50px;
        }
        .details {
            flex: 1;
            padding: 0 50px; /* Adjust the left and right padding */
            margin-top: 200px;
        }

        .details h2 {
            font-size: 32px;
            margin-top: 0;
            padding-left: 90px;
        }
        .details h3 {
            font-size: 32px;
            margin-top: 0;
            padding-left: 90px;
        }
        .details p {
            font-size: 18px;
            line-height: 1.5;
            padding-left: 90px;
            margin: 0; /* Remove margin */
        }
        .right-box {
            flex: 1;
            padding: 0 20px;
            border-width: 10px;
            border-color: aquamarine;
        }
        .right-box p {
            font-size: 14px;
            line-height: 1.5;
            margin: 0; /* Remove margin */
        }
        .details h6 {
            font-size: 14px;
            margin-top: 0;
            margin: 0; /* Remove margin */
            display: block; /* Change display to block */

            padding: 5px 10px; /* Add padding */
        }

        .details h6 span {
            color: #333; /* Black color */
            font-weight: bold;
        }

        .details .bordered-container {
            display: inline-block; /* Change display to inline-block */
            border: 1px solid #fff; /* White border */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Grey shadow */
            padding: 10px; /* Reduce padding */
            margin-right: 100px; /* Adjust margin-right to move the container to the left */
        }
        .button-container {
            text-align: center; /* Center the button horizontally */
            margin-top: 20px; /* Add some space between the text and the button */
        }

        .button-container button {
            font-size: 18px; /* Increase the font size */
            font-weight: bold; /* Set font weight to bold */
            padding: 10px 20px; /* Increase the padding */
            background-color: white; /* Default background color */
            color: darkblue; /* Default text color */
            border: 1px solid darkblue; /* Default border */
            transition: background-color 0.3s, color 0.3s; /* Smooth transition for background color and text color */
        }

        .button-container button:hover {
            background-color: darkblue; /* Change background color on hover */
            color: white; /* Change text color on hover */
        }

        .quantity-container {
            display: flex; /* Make the buttons and input field display in a row */
            align-items: center; /* Align items vertically in the center */
            border: 1px solid #ccc; /* Add border */
            border-radius: 5px; /* Add border radius */
            padding: 3px; /* Adjust padding */
            width: 120px; /* Adjust width */
            margin-left: auto; /* Move the container to the right */
        }

        .quantity-container button {
            background-color: transparent; /* Remove default button background */
            border: none; /* Remove default button border */
            cursor: pointer; /* Change cursor to pointer */
            font-size: 20px; /* Adjust font size */
            padding: 0 5px; /* Adjust padding */
        }

        .quantity-container button:hover {
            background-color: #f0f0f0; /* Change background color on hover */
        }

        .quantity-container input {
            border: none; /* Remove default input border */
            width: 40px; /* Adjust input width */
            text-align: center; /* Center align text */
        }





    </style>
</head>
<body>
    <div class="container">
        <div class="image">
            <img src="https://eglobuss.lv/storage/attachments/2y0/7ce/4bc/2y07ce4bcln23sbf34hfqpc73-350x500-resize-quality(85).webp" alt="Book Cover">
        </div>
        <div class="details">
            <h2>The Holy Grail of Investing</h2>
            <h3 style="color: red;">$16.77</h3> <!-- Adjusted price text color to red -->
            <p>"Tony Robbins returns with the final book in his financial freedom trilogy by unveiling the power of alternative investments. Robbins, and renowned investor Christopher Zook, take you on a journey to interview a dozen of the worlds most successful investors in private equity, private credit, private real estate, and venture capital. They share their favorite strategies and insights in this practical guidebook.<br><br>
                For decades, trillions of dollars in smart money has been making outsized returns using private equity, private credit, venture capital and other alternative investments."</p>
                <div class="button-container">
                    <div class="quantity-container">
                        <button id="decrement">-</button>
                        <input type="number" id="quantity" value="1" min="1" max="999">
                        <button id="increment">+</button>
                    </div>
                    <button>
                        <i class="fa-solid fa-book"></i>
                        <span style="font-weight: lighter;">Add to cart</span>
                    </button>
                </div>
        </div>
        <div class="details">
            <div class="bordered-container">
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;">Author:</span><span> Tony Robbins</span></h6>
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;">Manufacturer:</span><span> Simon & Schuster Audio</span></h6>
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;">Lanuage: </span><span>English</span></h6>
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;"> ISBN code:</span><span> B0CC9ZYFQP</span></h6>
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;">Cover type:</span><span> Hard</span></h6>
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;">Publication date:</span><span> February 13,2024</span></h6>
                <h6><span style="color: #B8B6B5 ; font-weight: lighter;">Print length:</span><span> 322</span></h6>
            </div>
        </div>
    </div>
</body>
<script>
    // Get the quantity input and buttons
    const quantityInput = document.getElementById('quantity');
    const decrementButton = document.getElementById('decrement');
    const incrementButton = document.getElementById('increment');

    // Add event listeners for increment and decrement buttons
    decrementButton.addEventListener('click', () => {
        decreaseQuantity();
    });

    incrementButton.addEventListener('click', () => {
        increaseQuantity();
    });

    // Function to decrease quantity
    function decreaseQuantity() {
        let currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
        }
    }

    // Function to increase quantity
    function increaseQuantity() {
        let currentValue = parseInt(quantityInput.value);
        if (currentValue < 999) {
            quantityInput.value = currentValue + 1;
        }
    }
</script>
</html>
