<%-- 
    Document   : products
    Created on : 16 Dec 2023, 01:12:27
    Author     : Sandun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="/Website/admin/admin.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Prompt:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        
        <title>Products - Admin | GREEN Supermart</title>
        
        <link rel="icon" href="https://i.postimg.cc/MKJm2kGp/favicon.png">
        
        <link rel="preload" href="/Website/admin/admin.css" as="style" type="text/css">
        <link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" as="style" type="text/css" crossorigin>
        <link rel="preload" href="https://i.postimg.cc/MKJm2kGp/favicon.png" as="image" type="image/png">
        <link rel="preload" href="https://i.postimg.cc/TwdpWvhk/admin-Logo.png" as="image" type="image/png">
        
        <script src="/Website/admin/admin.js" defer></script>
    </head>
    
    <body>
        
        <div class="body flex flexRow">
            
            <div class="navigation flex flexCol">
                
                <div class="navContainer flex flexCol">
                    <div class="navLogo flex" onclick="window.location.href='/Website/admin/dashboard.jsp'">
                        <img src="https://i.postimg.cc/TwdpWvhk/admin-Logo.png">
                    </div>
                    
                    <nav class="flex flexCol">
                        <span class="navLink flex flexRow" onclick="window.location.href='/Website/admin/dashboard.jsp'">
                            <span class="navLinkIcon flex">
                                <i class="fa-solid fa-gauge"></i>
                            </span>
                            Dashboard
                        </span>
                        
                        <span class="activeLink flex flexRow">
                            <span class="navLinkIcon flex">
                                <i class="fa-solid fa-box"></i>
                            </span>
                            Products
                        </span>
                        
                        <span class="navLink flex flexRow" onclick="window.location.href='/Website/admin/orders.jsp'">
                            <span class="navLinkIcon flex">
                                <i class="fa-solid fa-truck-fast"></i>
                            </span>
                            Orders
                        </span>
                        
                        <span class="navLink flex flexRow" onclick="window.location.href='/Website/admin/feedback.jsp'">
                            <span class="navLinkIcon flex">
                                <i class="fa-solid fa-comments"></i>
                            </span>
                            Feedback
                        </span>
                    </nav>
                </div>
                
            </div>
            
            <div class="dashboard">
                
                <!-- TOPBAR START ============================================================-->
                <div class="topBar flex" id="topBar"></div>
                <script src="/Website/admin/topBar.js"></script>
                <!--============================================================== TOPBAR END -->
                
                <div class="dashboardContent flex">
                    
                    <div class="dashboardContainer flex flexCol">
                        
                        <div class="pageTopic flex">
                            <div class="pageTopicContainer flex flexRow">
                                <h1>Products</h1>
                                
                                <span class="flex flexRow" style="gap: 10px;">
                                    <span class="addIcon flex" onclick="window.location.href='/Website/admin/products/new.jsp'" title="New Product">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                    
                                    <span class="reloadIcon flex" onclick="window.location.reload();" title="Refresh">
                                        <i class="fa-solid fa-arrows-rotate"></i>
                                    </span>
                                </span>
                            </div>
                        </div>
                        
                        <section style="width: 100%; height: 75vh;">
                            <div class="flex flexCol" style="width: calc(100% - 40px); height: calc(100% - 40px); color: #242424; background: #FFFFFF; padding: 15px 20px; border-radius: 10px;">
                                
                                <div class="flex flexRow" style="height: 100%; width: 100%; margin-top: 0; overflow: auto; align-items: start;">
                                    <div style="height: auto; width: 100%;">
                                        
                                        <table>
                                            <tr>
                                                <th style="width: 5%;">SKU</th>
                                                <th style="width: 25%;">Name</th>
                                                <th style="width: 25%;">Category</th>
                                                <th style="width: 10%;">Status</th>
                                                <th style="width: 10%;">Stock</th>
                                                <th style="width: 15%;">Price</th>
                                                <th style="width: 10%;">Actions</th>
                                            </tr>
                                            
                                            <tr>
                                                <td>001</td>
                                                <td>Sprite 1L</td>
                                                <td>Beverages</td>
                                                <td>In Stock</td>
                                                <td>134</td>
                                                <td>Rs. 250.00</td>
                                                <td>
                                                    <span class="entryActionIcons flex flexRow" style="gap: 10px;">
                                                        <span class="flex"><i class="fa-solid fa-pen"></i></span>
                                                        <span class="flex"><i class="fa-solid fa-trash-can"></i></span>
                                                    </span>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>002</td>
                                                <td>Sprite 1L</td>
                                                <td>Beverages</td>
                                                <td>In Stock</td>
                                                <td>29</td>
                                                <td>Rs. 250.00</td>
                                                <td>
                                                    <span class="entryActionIcons flex flexRow" style="gap: 10px;">
                                                        <span class="flex"><i class="fa-solid fa-pen"></i></span>
                                                        <span class="flex"><i class="fa-solid fa-trash-can"></i></span>
                                                    </span>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>003</td>
                                                <td>Sprite 1L</td>
                                                <td>Beverages</td>
                                                <td>In Stock</td>
                                                <td>51</td>
                                                <td>Rs. 250.00</td>
                                                <td>
                                                    <span class="entryActionIcons flex flexRow" style="gap: 10px;">
                                                        <span class="flex"><i class="fa-solid fa-pen"></i></span>
                                                        <span class="flex"><i class="fa-solid fa-trash-can"></i></span>
                                                    </span>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>004</td>
                                                <td>Sprite 1L</td>
                                                <td>Beverages</td>
                                                <td>In Stock</td>
                                                <td>341</td>
                                                <td>Rs. 250.00</td>
                                                <td>
                                                    <span class="entryActionIcons flex flexRow" style="gap: 10px;">
                                                        <span class="flex"><i class="fa-solid fa-pen"></i></span>
                                                        <span class="flex"><i class="fa-solid fa-trash-can"></i></span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </div>
                                </div>
                                
                            </div>
                        </section>
                        
                    </div>
                    
                </div>
            </div>
            
        </div>
        
    </body>
</html>
