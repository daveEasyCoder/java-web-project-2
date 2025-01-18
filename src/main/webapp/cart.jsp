<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import = "com.wevdev.foodDAO.FoodDB" %>
      <%@ page import = "com.webdev.model.CartFoods" %>
      <%@ page import = "com.webdev.connection.GetConn" %>
      <%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="css/NavbarStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
<style>
        body{
            font-family: Arial;
            padding-top: 80px;
            margin: 0;
        }


        .cart-page{
            max-width: 900px;
            margin: auto;
        }
        .cart-page-title{
            font-size: 31px;
            font-weight: bold;
            text-align: center;
            border-bottom: 1.3px solid rgb(230, 230, 230);
            padding-bottom: 18px;
        }
        .cart-section-row-item{
            box-shadow: 0px 0px 56px rgba(200, 200, 200, 0.2);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 6px;
            padding: 25px 30px;
            border-radius: 4px;
            margin-bottom: 4px;
        }
        .cart-section-image{
            width: 140px;
            height: 120px;
            object-fit: cover;
            border-radius: 3px;
        }
        .cart-section-left{
            display: flex;
            align-items: center;
            gap: 24px;
        }
        .priceCents{
            font-weight: bold;
            font-size: 18px;
        }
 
        .cart-section-item-name h3{
            margin-bottom: 4px;
        }
        .update-btn{
              font-weight: bold;
              display: flex;
              align-items: center;
              gap: 10px;
        }
        .cart-item-btn{
            border: none;
            height: 30px;
            width: 30px;
           cursor: pointer;
            border-radius: 50%;
            color: white;  
            font-size: 16px;
        }
        .update-btn-increase{
            background-color: rgb(220, 3, 3);
            text-decoration:none;
               display:flex;
            align-items:center;
            justify-content:center;
        }
        .update-btn-decrease{
            background-color: green;
            text-decoration:none;
            display:flex;
            align-items:center;
            justify-content:center;
        }
    .cart-item-delete-btn{
        padding: 6px 21px;
       text-decoration:none;
        color: white;
        background-color: red;
        border-radius: 4px;
        cursor: pointer;
        box-shadow: 0 0 20px rgb(255, 152, 152);
    }
    .cart-section{
        margin-top: 30px;
    }
  
	.Cart-total{
	 box-shadow: 0px 0px 32px rgba(203, 203, 203, 0.4);
	  width: 40%;
	  padding: 6px 12px;
	  margin-top: 20px;
	}
	.cart-total-column{
	   
	    margin-top: 13px;
	   
	}
	.cart-total-row{
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    margin-bottom: 5px;
	    padding: 9px 0;
	    font-size: 13px;
	    font-weight: bold;
	    color: gray;
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
              <li class="dropdown-link" style="margin-right: 6px;"><a class="link" href="#"><span>Category</span> <i class="fa-solid fa-angle-down"></i></a>
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

   
    <div class="cart-page">
        <p class="cart-page-title">Your <span style="color: aquamarine;">Cart</span></p>
          <div class="cart-section">
               <div class="cart-section-row">
				 <%
					  FoodDB food = new FoodDB(GetConn.getConnection());
					  List<CartFoods> foodList = food.getCartFoods();
					  for(CartFoods f:foodList){
						  
						 %>			 			 
		                <div class="cart-section-row-item">
		                    <div class="cart-section-left">
		                        <img class="cart-section-image" src="image/<%= f.getImage() %>" alt="">
		                        <div class="cart-section-item-name">
		                           <h3><%= f.getFood_name() %></h3>		         
		                        </div>
		                    </div>
		                      <div class="priceCents">$<%= f.getPrice() %></div>
		                      <div class="update-btn">
		                          <a href="update?id=<%= f.getId() %>&action=increase" class="update-btn-increase cart-item-btn">+</a>
		                          <span class="cart-item-quantity"><%= f.getQuantity() %></span>
		                          <a href="update?id=<%= f.getId() %>&action=decrease" class="update-btn-decrease cart-item-btn">
		                             -
		                          </a>
		                      </div>
		                      <div>
		                         <a href="delete?id=<%= f.getId()%>"  class="cart-item-delete-btn">delete</a>
		                      </div>
		                  </div>
						  
					 <% }
					  
					%>
     
               </div>

               <!-- Cart total -->
                <div class="Cart-total">
                    <h3 style="margin: 0;color: rgb(23, 23, 23);">Cart Total</h3>
                    <div class="cart-total-column">
                        <div class="cart-total-row" style="border-bottom: 1px solid rgb(159, 159, 159)">
                            <div>Quantity</div>
                            <div>
                            <% 
                            int sum = 0;
                            for(CartFoods f: foodList){
                            	sum = sum+f.getQuantity();
                            }
                            
                         
                            
                            %>
                            <span><%= sum %></span>
                            </div>
                        </div>
                
                        <div class="cart-total-row">
                            <div>Total Price</div>
                            <div>
	                            <% 
	                            Double totalPrice = 0.0;
	                            for(CartFoods f: foodList){
	                            	totalPrice = totalPrice + f.getPrice()*f.getQuantity();
	                            }
	                            
	                            %>
	                            <span><%= totalPrice %></span>
                            </div>
                        </div>
                    </div>
                </div>
          </div>
    </div>



        <!-- Footer start -->
        <div class="footer">
            <div class="footer-text">
                <div>Service</div>
                <div>Terms</div>
            </div>
             <div class="developer">Developed by Dawit Tiruneh</div>
         </div>
         <!-- Footer end --> 
   
</body>
</html>