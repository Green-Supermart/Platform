<%-- 
    Document   : Checkoutnew
    Created on : Dec 19, 2023, 11:03:37 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../cart.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        
        <title>Checkout | GREEN Supermart</title>
        
        <link rel="icon" href="https://i.postimg.cc/MKJm2kGp/favicon.png">
        
        <link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" as="style" type="text/css" crossorigin>
        
        <script src="../script.js" defer></script>
        <script src="../cart.js" defer></script>
    </head>
    <body>
         <!-- NAVBAR START ============================================================-->
        <nav id="navbar"></nav>
        <script src="../navbar.js"></script>
        <!--============================================================== NAVBAR END -->
        
        
        <!-- HEADER START ============================================================-->
        <header class="flex">
            <h1>Checkout</h1>
        </header>
        <!--============================================================== HEADER END -->
        
        <div class="containerBlock flex">
            <div class="container">

                <div class="containerCO">
                    <div class="COcard">
                        <div class="newdate">December 14, 2023</div>
                        <div class="COorderNumber">Order No.20757</div>
                        <table>
                            <tbody id="cartContainer">

<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <a href="">--%>
<%--                                        <i class="fa-solid fa-trash-can" style="color: #808080;"></i>--%>
<%--                                    </a>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <img src="https://i.postimg.cc/brf9L1tT/placeholder.png" alt="Image 1" class="COImage">--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <div class="COItem">Item 01</div>--%>
<%--                                </td>--%>
<%--                                <td style="width: 76%; text-align: right;">--%>
<%--                                    <div class="COquantity">--%>
<%--                                        ×3--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                                <td style="width: 8%; text-align: right;">--%>
<%--                                    <div class="COprice" >--%>
<%--                                        180--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>

                            </tbody>
                        </table>


                        <table>
                            <tr>
                                <td colspan="5">
                                    <hr style="margin: 5px 0; border: none; border-top: 1px solid #ddd;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: left; padding:20px; padding-right: 10px;">
                                    <div class="COTotalLabel">Total</div>
                                </td>
                                <td style="text-align: right;" colspan="2" >
                                    <div id="totalBill" class="COTotalPrice">
                                        Null
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

                <div class="helpCardsContainer flex flexCol" style="margin-bottom: 40px;">
                    <div class="helpLink flex flexRow">

                        <div class="linkContent flex">
                            <div class="linkText flex flexCol">
                                <h1>Delivery address</h1>
                                <h1 style="color:black; font-size:20px;">123, York Street, New York, USA. </h1>
                            </div>

                            <a href="">
                                <i class="fa-solid fa-chevron-right" style="color: #01a733;font-size: 20px; " ></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="CObuttoncon flex">
                    <button class="CObutton">Checkout</button>
                </div>
            </div>
        </div>


         <script>
             const cartItems = JSON.parse(localStorage.getItem("cart")) || [];
             let totalBillAmount = 0;

             const containerNew = document.getElementById('cartContainer');

             Promise.all(cartItems.map(item => {
                 let arrayIndex = item.productId - 1;

                 return fetch(`/getProductDetails?id=`+item.productId)
                     .then(response => response.json())
                     .then(productDetails => {
                         const singleProduct = productDetails[arrayIndex];

                         if (singleProduct) {
                             const price = singleProduct.discPrice;
                             const quantity = item.quantity;
                             let subTotal = 0;

                             totalBillAmount += price * quantity;

                             subTotal = price * quantity;

                             const cartItemElement = document.createElement('tr');
                             cartItemElement.className = 'cart-item';

                             const cartItemHTML =
                                 `
                                    <td>
                                        <a href="" onclick="removeFromCart(`+item.productId+`)">
                                            <i class="fa-solid fa-trash-can" style="color: #808080;"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <img src="`+singleProduct.image+`" alt="Image 1" class="COImage">
                                    </td>
                                    <td>
                                        <div class="COItem">`+singleProduct.name+`</div>
                                    </td>
                                    <td style="width: 50%; text-align: right;">
                                        <div class="COquantity">
                                            ×`+quantity+`
                                        </div>
                                    </td>
                                    <td style="width: 8%; text-align: right;">
                                        <div class="COprice" >
                                            `+subTotal+`
                                        </div>
                                    </td>
                        `;

                             cartItemElement.innerHTML = cartItemHTML;
                             containerNew.appendChild(cartItemElement);
                         } else {
                             console.error(`Product with ID `+item.productId+` not found`);
                         }
                     })
                     .catch(error => {
                         console.error('Error fetching product details:', error);
                     });
             }))
                 .then(() => {
                     document.getElementById('totalBill').innerText = `Rs. `+totalBillAmount.toFixed(2);
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
                     location.reload();

                 } else {
                     // Product not found in the cart
                     // You can handle this case as needed
                     alert("Product not found in cart!");
                 }
             }
         </script>



        <footer class="flex" id="footer"></footer>
        <script src="../footer.js"></script>
        <!--============================================================== FOOTER END -->
        
        
        <!-- SCROLL-TO-TOP START =====================================================-->
        <button id="toTopBtn" class="flex greenBtn" title="Scroll to Top">
            <i class="fa-solid fa-chevron-up"></i>
        </button>
	    <!--======================================================= SCROLL-TO-TOP END -->
    </body>
</html>