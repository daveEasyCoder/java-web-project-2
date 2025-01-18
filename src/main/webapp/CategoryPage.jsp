<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.PreparedStatement" %>
 <%@ page import = "java.sql.Connection" %>
 <%@ page import = "java.sql.ResultSet" %>
 <%@ page import = "com.webdev.connection.GetConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
<link rel="stylesheet" href="css/NavbarStyle.css">
<link rel="stylesheet" href="css/productItem.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
 <style>
    body{
     font-family:Arial;
     margin:0;
     margin-top:120px
    }

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
  /* Main end */
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
    <!-- Navbar-section start -->
    <div class="navbar-section">
      <div class="navbar">
        <div class="logo">Shop</div>
        
          <div class="right-nav">
            <ul>
              <li><a class="link active" href="index.jsp">Home</a></li>
              <li class="dropdown-link" style="margin-right: 6px;"><a class="link" href=""><span>Category</span> <i class="fa-solid fa-angle-down"></i></a>
                <div class="drop-down-menu">
                   <div><a href="CategoryPage.jsp?action=fruit">Fruits</a></div>
                   <div><a href="CategoryPage.jsp?action=vegetable">Vegetable</a></div>
                   <div><a href="CategoryPage.jsp?action=chicken">Chickens</a></div>
                   <div><a href="CategoryPage.jsp?action=cake">Cake</a></div>
                   <div><a href="CategoryPage.jsp?action=drink">Drinks</a></div>
                </div>
           </li>
             
              <li><a class="link" href="cart.jsp">Cart</a></li>
              <li><a class="logout-btn" href="">Logout</a></li>
            </ul>
          </div>
          </div>
      </div>
    <!-- Navbar section end -->
   <div class="product-section"> 
   <%
   Connection con = GetConn.getConnection();
   String action = request.getParameter("action");
   String sql = "SELECT * FROM foods WHERE category=?";
   PreparedStatement ps = con.prepareStatement(sql);
   ps.setString(1,action);
   ResultSet result = ps.executeQuery();
   while(result.next()){
	   %>
  	     <div class="product-item">
		        <div class="item-pic">
		          <img class="item-image" src="image/<%= result.getString("image") %>" />
		        </div>
		        <div class="product-item-footer">
		          <h3 class="font-bold"><%= result.getString("food_name") %></h3>
		          <p class="item-price">price: <%= result.getString("price") %></p>
		           <a href="AddtoCart?id=<%= result.getString("id") %>" class="cart-button add-to-cart">Add To Cart</a>
		           <a href="Details.jsp?id=<%= result.getString("id") %>" class="cart-button details-btn">See details</a>
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