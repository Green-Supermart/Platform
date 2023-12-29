<%-- 
    Document   : wishlist
    Created on : 30 Nov 2023, 15:32:27
    Author     : Sandun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="cart.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        
        <title>Wishlist | GREEN Supermart</title>
        
        <link rel="icon" href="https://i.postimg.cc/MKJm2kGp/favicon.png">
        
        <link rel="preload" href="style.css" as="style" type="text/css">
        <link rel="preload" href="cart.css" as="style" type="text/css">
        <link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" as="style" type="text/css" crossorigin>
        <link rel="preload" href="https://i.postimg.cc/MKJm2kGp/favicon.png" as="image" type="image/png">
        <link rel="preload" href="https://i.postimg.cc/G9nCKgLp/green-Logo.png" as="image" type="image/png">
        <link rel="preload" href="https://i.postimg.cc/brf9L1tT/placeholder.png" as="image" type="image/png">
        
        <script src="script.js" defer></script>
        <script src="cart.js" defer></script>
    </head>
    
    <body>
        
        <!-- NAVBAR START ============================================================-->
        <nav id="navbar"></nav>
        <script src="navbar.js"></script>
        <!--============================================================== NAVBAR END -->
        
        
        <!-- HEADER START ============================================================-->
        <header class="flex">
            <h1>Wishlist</h1>
        </header>
        <!--============================================================== HEADER END -->
        
        
        <!-- PAGE-CONTENT START ======================================================-->
        <div class="containerBlock flex">
            <div class="container">
                
                <div id="wishlistContainer" class="cardsContainer flex flexRow">

                </div>
                
                
            </div>
        </div>

        <script>
            const wishlistItems = JSON.parse(localStorage.getItem("wishlist")) || [];

            const wishlistContainer = document.getElementById('wishlistContainer');

            Promise.all(wishlistItems.map(item => {
                let arrayIndex = item.productId - 1;

                return fetch(`/getProductDetails?id=`+item.productId)
                    .then(response => response.json())
                    .then(productDetails => {
                        const singleProduct = productDetails[arrayIndex];

                        if (singleProduct) {
                            const id = singleProduct.id;
                            const discPrice = singleProduct.discPrice;
                            const orgPrice = singleProduct.orgPrice;
                            const image = singleProduct.image;
                            const name = singleProduct.name;

                            const wishlistItemElement = document.createElement('div');
                            wishlistItemElement.className = 'wishlist-item';

                            const wishlistItemHTML =
                                `<div class="productCard flex flexCol" style="width: 275px; height: 425px;">
                                <div class="productImg flex">
                                    <div class="productIcons flex flexRow">
                                        <span class="discIndicator">
                                            -20%
                                        </span>
                                        <span class="wishlistIndicator">
                                            <i class="fa-regular fa-trash-can" onclick="removeFromWishlist(`+id+`)"></i>
                                        </span>
                                    </div>
                                    <img src="`+image+`" style="width: 275px; height: 275px;">
                                </div>
                                <div class="productContent flex flexCol">
                                    <h1>
                                        <a href="/singleProduct.jsp?productId=`+id+`">
                                            ` +name+ `
                                        </a>
                                    </h1>
                                    <span class="productPrice flex flexRow">
                                        <h2 class="price">Rs. ` +discPrice+ `.00</h2>
                                        <h2 class="discPrice">Rs. ` +orgPrice+ `.00</h2>
                                    </span>
                                    <button class="addToCartBtn flex flexRow" onclick="addToCart(`+id+`)">
                                        <i class="fa-solid fa-cart-plus"></i>
                                            Add to Cart
                                    </button>
                                </div>
                            </div> `;

                            wishlistItemElement.innerHTML = wishlistItemHTML;
                            wishlistContainer.appendChild(wishlistItemElement);
                        } else {
                            console.error(`Product with ID `+item.productId+` not found`);
                        }
                    })
                    .catch(error => {
                        console.error('Error fetching product details:', error);
                    });
            }))
                .then(() => {

                })
                .catch(error => {
                    console.error('Error fetching product details:', error);
                });


            //display cart empty message
            const wishlistBody = document.getElementById("wishlistContainer")

            // check if there is any cartItem in cartList, if not, show "Your cart is empty" message
            setInterval(function() {
                if (wishlistBody.children.length === 0) {
                    wishlistBody.innerHTML = `<div style="background: #ffffff; position: relative; display: flex; width: 1300px; border-radius: 10px; height: 200px"> <p id="cartEmptyMsg" style="display: flex; width: 100%; color: #808080; background: #ffffff; justify-content: center; align-items: center; font-size: 18px; font-weight: 300; position: absolute; top: 90px;">Your wishlist is empty</p> </div>`;
                }
            }, 1000);



            function addToCart(productId) {
                // Get existing cart items or initialize an empty array
                let cartItems = JSON.parse(localStorage.getItem("cart")) || [];

                // Check if the product ID is already in the cart
                const existingItem = cartItems.find(item => item.productId === productId);

                if (existingItem) {
                    // Increment the quantity if the product is already in the cart
                    existingItem.quantity++;
                } else {
                    // Add the new product to the cart with quantity 1
                    cartItems.push({ productId, quantity: 1 });
                }

                // Update the cart in localStorage
                localStorage.setItem("cart", JSON.stringify(cartItems));

                // Provide feedback to the user (optional)
                alert("Product added to cart!");
                removeFromWishlist(productId);
                location.reload();
            }


            function removeFromWishlist(productId) {
                // Get existing wishlist items or initialize an empty array
                let wishlistItems = JSON.parse(localStorage.getItem("wishlist")) || [];

                // Find the index of the product with the given ID in the wishlist
                const productIndex = wishlistItems.findIndex(item => item.productId === productId);

                if (productIndex !== -1) {
                    // Remove the product from the wishlist array
                    wishlistItems.splice(productIndex, 1);

                    // Update the wishlist in localStorage
                    localStorage.setItem("wishlist", JSON.stringify(wishlistItems));

                    // Provide feedback to the user (optional)
                    //alert("Product removed from wishlist!");
                    location.reload();

                } else {
                    // Product not found in the cart
                    // You can handle this case as needed
                    alert("Product not found in wishlist!");
                }
            }
        </script>
        <!--======================================================== PAGE-CONTENT END -->
        
        
        <!-- FOOTER START ============================================================-->
        <footer class="flex" id="footer"></footer>
        <script src="footer.js"></script>
        <!--============================================================== FOOTER END -->
        
        
        <!-- SCROLL-TO-TOP START =====================================================-->
        <button id="toTopBtn" class="flex greenBtn" title="Scroll to Top">
            <i class="fa-solid fa-chevron-up"></i>
        </button>
	<!--======================================================= SCROLL-TO-TOP END -->
        
    </body>
</html>
