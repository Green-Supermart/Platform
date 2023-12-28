


const cartIcon = document.getElementById("cartIcon");
const cartBackdrop = document.getElementById("cartBackdrop");
const cartBackIcon = document.getElementById("cartBackIcon");
const cartBox = document.getElementById("cartBox");
const cartCancelBtn = document.getElementById("cartCancelBtn");
const cartListContainer = document.getElementById("cartListContainer");
const cartList = document.getElementById("cartList");



function noScroll() {
    document.body.style.overflow = "hidden";
}

function scroll() {
    document.body.style.overflow = "auto";
}

// show cartBox
function showCart() {
    cartBackdrop.style.display = "block";
    cartBox.style.display = "flex";
    document.body.style.overflow = "hidden";
}

// hide cartBox
function hideCart() {
    cartBackdrop.style.display = "none";
    cartBox.style.display = "none";
    document.body.style.overflow = "auto";
}


cartIcon.addEventListener('click', function() {
    if (cartBackdrop.style.display === "none") {
        showCart();
    } else {
        hideCart();
    }
});

// hide cartBox when clicked outside
document.addEventListener('click', function(event) {
    if (!cartIcon.contains(event.target)) {
        cartBackdrop.style.display = "none";
        cartBox.style.display = "none";
        document.body.style.overflow = "auto";
    }
});
cartBox.addEventListener('click', function(event) {
    event.stopPropagation();
});
cartBackIcon.addEventListener('click', function(event) {
    cartBackdrop.style.display = "none";
    cartBox.style.display = "none";
    document.body.style.overflow = "auto";
});
cartCancelBtn.addEventListener('click', function(event) {
    cartBackdrop.style.display = "none";
    cartBox.style.display = "none";
    document.body.style.overflow = "auto";
});


// when pressed alt key + c, toggle cartBox show/hide
document.addEventListener('keydown', function(event) {
    if (event.altKey && event.key === "c") {
        if (cartBackdrop.style.display === "none") {
            showCart();
        } else {
            hideCart();
        }
    }
});











// Retrieve cart items from localStorage
const cartItems = JSON.parse(localStorage.getItem("cart")) || [];
let totalBillAmount = 0;
let totalProductCount = 0;

// const containerCart = document.getElementById('cartList');

// Use Promise.all to wait for all fetch operations to complete
Promise.all(cartItems.map(item => {
    let arrayIndex = item.productId - 1;

    // Fetch product details from the /retrieveProducts servlet for each item
    return fetch(`/getProductDetails?id=`+item.productId)
        .then(response => response.json())
        .then(productDetails => {
            const singleProduct = productDetails[arrayIndex]; // getting relevant product details (arrayIndex) by subtracting productId from 1

            if (singleProduct) {
                const price = singleProduct.discPrice;
                const quantity = item.quantity;
                let subTotal = 0;

                // Update total bill amount
                totalBillAmount += price * quantity;

                //create subtotal amount
                subTotal = price * quantity;


                // Display product details in your HTML
                const cartItemElement = document.createElement('div');
                //cartItemElement.className = 'cart-item';
                cartItemElement.classList.add('cartItem');

                const cartItemHTML =
                    `
                        <div style="height: 100%; width: 70px;">
                            <img style="height: 100%; width: 100%; object-fit: cover; border-radius: 5px;" src="`+singleProduct.image+`" alt="Product Image">
                        </div>
                        <div style="height: 100%; width: calc(100% - 165px); display: flex; flex-direction: column; justify-content: center;">
                            <h1 style="font-size: 12px; font-weight: 400;">`+singleProduct.name+`</h1>
                            <h2 style="font-size: 10px; font-weight: 300;">`+quantity+`</h2>
                        </div>
                        <div class="cartItemAction" style="height: 100%; width: 70px; display: flex; justify-content: end; align-items: center; margin-right: 15px;">
                            <i onclick="removeFromCart(`+item.productId+`)" class="fa-solid fa-trash-can"></i>
                            <p class="cartItemPrice">Rs. <span class="cartItemPrice">`+subTotal+`</span></p>
                        </div>
                         `;

                // Populate the cart item with product data
                cartItemElement.innerHTML = cartItemHTML;

                // Append the cart item to the containerCart
                cartList.appendChild(cartItemElement);
            } else {
                console.error(`Product with ID `+item.productId+` not found`);
            }
        })
        .catch(error => {
            console.error('Error fetching product details:', error);
        });
}))
    .then(() => {
        // Display the total bill amount and total product count
        document.getElementById('cartTotalPrice').innerText = `Rs `+totalBillAmount;
    })
    .catch(error => {
        console.error('Error fetching product details:', error);
    });


function removeFromCart(productId) {
    // Get existing cart items or initialize an empty array
    let cartItems = JSON.parse(localStorage.getItem("cart")) || [];

    // Find the index of the product with the given ID in the cart
    const productIndex = cartItems.findIndex(item => item.productId === productId);

    if (productIndex !== -1) {
        // Remove the product from the cart array
        cartItems.splice(productIndex, 1);

        // Update the cart in localStorage
        localStorage.setItem("cart", JSON.stringify(cartItems));

        // Provide feedback to the user (optional)
        alert("Product removed from cart!");
    } else {
        // Product not found in the cart
        // You can handle this case as needed
        alert("Product not found in cart!");
    }
}














// // do saveCartList() every 5 seconds and whenever cartList is changed
// setInterval(function() {
//     saveCartList();
// }, 5000);
// cartList.addEventListener('change', function() {
//     saveCartList();
// });
//
// // save cartList in localStorage
// function saveCartList() {
//     localStorage.setItem('cartList', cartList.innerHTML);
// }
//
//
// // load cartList from localStorage every time the page is loaded and every 1 second
// window.addEventListener('load', function() {
//     cartList.innerHTML = localStorage.getItem('cartList');
// });
// setInterval(function() {
//     cartList.innerHTML = localStorage.getItem('cartList');
// }, 5000);
//
// const cartAddBtn = document.getElementById("cartAddBtn");
//
// cartAddBtn.addEventListener('click', function() {
//     const cartItemDiv = document.createElement('div');
//     cartItemDiv.classList.add('cartItem');
//     cartItemDiv.innerHTML = `
//     <div style="height: 100%; width: 50px;">
//     <img style="height: 100%; width: 100%; object-fit: cover; border-radius: 5px;" src="https://i.postimg.cc/brf9L1tT/placeholder.png" alt="Product Image">
//     </div>
//     <div style="height: 100%; width: calc(100% - 165px); display: flex; flex-direction: column; justify-content: center;">
//     <h1 style="font-size: 12px; font-weight: 400;">Product Title</h1>
//     <h2 style="font-size: 10px; font-weight: 300;">Quantity: 2</h2>
//     </div>
//     <div class="cartItemAction" style="height: 100%; width: 70px; display: flex; justify-content: end; align-items: center; margin-right: 15px;">
//     <i class="fa-solid fa-trash-can"></i>
//     <p class="cartItemPrice">Rs. <span class="cartItemPrice">500</span></p>
//     </div>
//     `;
//     cartList.appendChild(cartItemDiv);
// });
//
// // whenever cartAddBtn is clicked, update cartItemCount and do saveCartList()
// cartAddBtn.addEventListener('click', function() {
//     saveCartList();
// });
//
// // whenever "i" element in cartItem clicked, remove the included cartItem element from the cartList
// cartList.addEventListener('click', function(event) {
//     if (event.target.classList.contains('fa-trash-can')) {
//         event.target.parentElement.parentElement.remove();
//         saveCartList();
//     }
// });










const cartEmptyMsg = document.getElementById("cartEmptyMsg");

// check if there is any cartItem in cartList, if not, show "Your cart is empty" message
setInterval(function() {
    if (cartList.innerHTML === "") {
        cartEmptyMsg.style.display = 'flex';
    } else {
        cartEmptyMsg.style.display = 'none';
    }
}, 1000);