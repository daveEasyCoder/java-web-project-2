<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.wevdev.foodDAO.FoodDB" %>
    <%@ page import = "com.wevdev.foodDAO.DATABASE" %>
    <%@ page import = "com.webdev.model.Foods" %>
    <%@ page import = "com.webdev.model.CartFoods" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "java.util.List" %>
    <%@ page import = "com.webdev.connection.GetConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="css/NavbarStyle.css">
<link rel="stylesheet" href="css/hero.css">
<link rel="stylesheet" href="css/productItem.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial;
    padding-top: 70px;
    overflow-x: hidden;
  }
  /* Hero start */
  .hero-section img {
    width: 100%;
    height: 400px;
  }
  /* Hero end */


  
  	/* Footer start */
	.footer{
	    background-color: rgb(5, 22, 44);
	    padding: 19px 23px;
	    color: white;
	    margin-top: 50px;
	    display:flex;
	   
	}
	.footer-text{
	    display: flex;
	    align-items: center;
	    gap: 10px;
	    width:40%
	}
	.developer{
	 width:60%;
	}
	/* Footer end */
	  @media(max-width:1100px){
    .product-section {
    grid-template-columns: repeat(3, 1fr);
    max-width: 800px;
  }
  }
  @media(max-width:830px){
    .product-section {
    grid-template-columns: repeat(2, 1fr);
    max-width: 550px;
  }
  }
  @media(max-width:530px){
    .product-section {
    max-width: 430px;
  }
  .product-item {
    width: 200px;
  }
  .item-image {
    height: 140px;
  }
  }
</style>
</head>
<body>


<%
  DATABASE db = new DATABASE();
  db.start();
%>




    <!-- Navbar-section start -->
    <div class="navbar-section">
      <div class="navbar">
        <div class="logo">Shop</div>
        
          <div class="right-nav">
            <ul>
              <li><a class="link active" href="index.jsp">Home</a></li>
              <li class="dropdown-link" style="margin-right: 6px;"><a class="link" href="#"><span>Category</span> <i class="fa-solid fa-angle-down"></i></a>
                <div class="drop-down-menu">
                   <div><a href="CategoryPage.jsp?action=fruit">Fruits</a></div>
                   <div><a href="CategoryPage.jsp?action=vegetable">Vegetable</a></div>
                   <div><a href="CategoryPage.jsp?action=chicken">Chickens</a></div>
                   <div><a href="CategoryPage.jsp?action=cake">Cake</a></div>
                   <div><a href="CategoryPage.jsp?action=drink">Drinks</a></div>
                </div>
           </li>
             
              <li><a class="link" href="cart.jsp">
                  Cart
              </a></li>
              <li><a class="logout-btn" href="">Logout</a></li>
            </ul>
          </div>
          </div>
      </div>
    <!-- Navbar section end -->
    
 
    
        <!-- Hero section start -->
      <div class="hero-section" style="background-image: linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.3)),url('image/hero.webp')">
        <div class="hero-section-texts">
            <p class="welcome">WELCOME TO</p>
            <h1>FOOD PARADISE</h1>
             <p class="delicious-recipes">Delicious Recipes</p>
             <div style="text-align: center;">
               <button class="hero-explore-now">EXPLORE NOW</button>
             </div>
         </div>
      </div>
    <!-- Hero section end -->


   <div class="all-products-title">All Products</div>
    <div class="product-section">
		<%  
		
		 FoodDB foods = new FoodDB(GetConn.getConnection());
		 List<Foods> foodList = foods.getAllFoods();
		 
		 for(Foods f:foodList){
			 %>
			  <div class="product-item">
		        <div class="item-pic">
		          <img class="item-image" src="image/<%= f.getImage() %>" />
		        </div>
		        <div class="product-item-footer">
		          <h3 class="font-bold"><%= f.getFood_name() %></h3>
		          <p class="item-price">price: <%= f.getPrice() %></p>
		           <a href="AddtoCart?id=<%= f.getId() %>" class="cart-button add-to-cart">Add To Cart</a>
		           <a href="Details.jsp?id=<%= f.getId() %>" class="cart-button details-btn">See details</a>
		        </div>
		      </div>
		 <%}
		 
		%>
    </div>
    
    

    
            <!-- Footer start -->
        <div class="footer">
            <div class="footer-text">
                <div>Service</div>
                <div>Terms</div>
            </div>
            <div>Developed by Dawit Tiruneh</div>
         </div>
         <!-- Footer end --> 
</body>
</html>