<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.PreparedStatement" %>
    <%@ page import = "java.sql.ResultSet" %>
    <%@ page import = "java.sql.Connection" %>
    <%@ page import = "com.webdev.connection.GetConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link rel="stylesheet" href="css/NavbarStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
    <style>
        body{
            font-family: Arial;
            padding-top: 100px;
            margin: 0;
        }
        .details{
            padding:10px 30px;
            max-width: 850px;
            margin: auto;
        }
        .details-image-container{
            width: 60%; 
            padding-bottom: 40px;
            border-bottom: 2px solid rgba(189, 189, 189, 0.4);
        }
        .details-food-image{
            width: 100%;
            height:200px;
            object-fit: cover;
        }
        .details-food-description{
            font-size: 13px;
            color: gray;
        }
        .details-summary{
            font-weight: bold;
            color: rgb(115, 115, 115);
            font-size: 14px;
        }
        .details-summary p{
            margin: 3px 0;
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

    <%
      Connection con = GetConn.getConnection();
      int id = Integer.parseInt(request.getParameter("id"));
      String query = "SELECT * FROM foods WHERE id = ?";
      PreparedStatement ps = con.prepareStatement(query);
      ps.setInt(1,id);
      ResultSet rs = ps.executeQuery();
      
      while(rs.next()){
    	  %>
	      <div class="details">
	         <div>
	             <div class="details-image-container">
	                <img class="details-food-image" src="image/<%= rs.getString("image") %>" alt="IMAGE">
	             </div>
	            <h2 class="details-food-name"><%=rs.getString("food_name") %></h2>
	            <p class="details-food-description"><%=rs.getString("f_description") %></p>
	         </div>
	
	         <div class="details-summary">
	              <p>Category: <%= rs.getString("category") %></p>
	              <p>price: $<%= rs.getString("price") %></p>
	         </div>
	    </div>
    <%  }
    %>





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