<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.ks2334.Database,java.sql.*" %>

<%
Database db = new Database();
ResultSet rs;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Design System for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Sportify</title>
  <!-- Favicon -->
  <link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="${pageContext.request.contextPath}/assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Argon CSS -->
  <link type="text/css" href="${pageContext.request.contextPath}/assets/css/argon.css?v=1.1.0" rel="stylesheet">

  
  <link rel='stylesheet' href='https://unpkg.com/font-awesome@4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/cardstyle.css">
  <script type="text/javascript" src="/test/wp-content/themes/child/script/jquery.jcarousel.min.js"></script>
    <style>
  	.myclass1{}
  	.myclass2{}
  	.myclass3{}
  	.profilePic:before{
	    background-image: url(./assets/img/theme/team-4-800x800.jpg);
  	}
  </style>
</head>

<body>
  <header class="header-global">
    <nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light">
      <div class="container">
        <a class="navbar-brand mr-lg-5" href="${pageContext.request.contextPath}/index.html">
          <img alt="image" src="${pageContext.request.contextPath}/assets/img/brand/white.png">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbar_global">
          <div class="navbar-collapse-header">
            <div class="row">
              <div class="col-6 collapse-brand">
                <a href="${pageContext.request.contextPath}/index.html">
                  <img alt="image" src="${pageContext.request.contextPath}/assets/img/brand/blue.png">
                </a>
              </div>
              <div class="col-6 collapse-close">
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>
          <ul class="navbar-nav navbar-nav-hover align-items-lg-center ml-lg-auto">
            <li class="nav-item dropdown">
              <a href="#" class="nav-link" role="button">
                <i class="ni ni-ui-04 d-lg-none"></i>
                <span class="nav-link-inner--text">About Us</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link" role="button">
                <i class="ni ni-collection d-lg-none"></i>
                <span class="nav-link-inner--text">Contact Us</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link" data-toggle="dropdown" role="button">
                <i class="ni ni-collection d-lg-none"></i>
                <span class="nav-link-inner--text">Hey, <%
                	String username = session.getAttribute("loggedInUser").toString();
                	out.println(username);
                %><i class='ni ni-bold-down'></i></span>
              </a>
              <div class="dropdown-menu">
                <a href="${pageContext.request.contextPath}/profile" class="dropdown-item">Profile</a>
                <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">Logout</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <main>
 	
    <div class="position-relative">
      <section class="section section-lg section-hero section-shaped" style="min-height:90vh;">
        <div class="shape shape-style-1 shape-primary">
          <span class="span-150"></span>
          <span class="span-50"></span>
          <span class="span-50"></span>
          <span class="span-75"></span>
          <span class="span-100"></span>
          <span class="span-75"></span>
          <span class="span-50"></span>
          <span class="span-100"></span>
          <span class="span-50"></span>
          <span class="span-100"></span>
        </div>
        <!-- SVG separator -->
        <div class="container">
          <div class="row justify-content-center mt-5">
            <div class="col-lg-12">
              <!-- Tabs with icons -->
              
              <div class="nav-wrapper">
                <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab" href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab" href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>Suggestions</a>
                  </li>
                </ul>
              </div>
              <div class="card shadow">
                <div class="card-body">
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">
                      <h3 class="text-center my-1">Hey, {Name}</h3>
                      <hr>
                      <h3 class="heading-title text-warning mb-4 ml-3 mt-2" style="font-style:italic">Notifications </h3>
                      
                      <div class="alert alert-info alert-dismissible fade show m-2" role="alert">
				        <span class="alert-inner--icon"><i class="ni ni-bell-55"></i></span>
				        <span class="alert-inner--text"><strong>
				        You Have New Friend Requests and Match Requests! Check them out! 
				        </strong></span>
				        <button type="button" class="close" style="font-size:1.1rem;">
				        	View
				        </button>
				      </div>
				      <hr>
				      <h3 class="heading-title text-warning mb-4 ml-3 mt-3" style="font-style:italic">Upcoming Matches</h3>
				      <%
				      	for(int i=0;i<10;i++){
				      		if(i%2==0){
				      			out.println("<div class='alert alert-warning alert-dismissible fade show' role='alert'>");	
				      		}
				      		else{
				      			out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'>");
				      		}				      		
				      		out.println("<span class='alert-inner--icon'><i class='ni ni-bell-55'></i></span>");
				      		out.println("<span class='alert-inner--text'><strong>You have a match with {Name} on {Date}</strong></span>");
				      		out.println("<button type='button' class='close' style='font-size:1.1rem;'>Details</button>");
				      		out.println("</div>");
				      	}
				      %>
				      </div>
                    <div class="tab-pane fade" id="tabs-icons-text-2" role="tabpanel" aria-labelledby="tabs-icons-text-2-tab">
                
                    <h3 class="text-center my-3">User Suggestions</h3>
                    <div id="myCarousel2" class="carousel slide" data-ride="carousel" style="width: 100%;">
                      <div class="carousel-inner row w-100 mx-auto" id="carousel-inner2">
                       <%
                   	   ResultSet suggestions = db.getSuggestions(username);
                       int i=0;
                       while(suggestions.next()){
                    	   if(i==0){
                    		   out.println("<div id="+ suggestions.getString(1) +" class='myclass2 carousel-item col-md-4 active'>");
                      		}
                      		else{
                      			out.println("<div id="+ suggestions.getString(1) +" class='myclass2 carousel-item col-md-4'>");
                      		}
                      		out.println(" <div class='card'>");
                      		out.println("  <div class='card-body'>");
                      		out.println("   <div class='row d-flex justify-content-center'>");
                      		out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/profilePics/"+suggestions.getString(1)+"' class='img-fluid rounded shadow' style='width: 150px;' alt='image'>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mt-3'>");
                      		out.println("    <a href='"+request.getContextPath()+"/profiles?name="+suggestions.getString(1)+"'><h5 class='card-title'>"+suggestions.getString(1)+"</h5></a> ");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center'>");
                      		out.println("    <h5 class='card-title'>"+suggestions.getString(2)+" " +suggestions.getString(3)+"</h5> ");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		out.println("    <p class='card-text'>"+ suggestions.getString(4) +"</p>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		out.println("    <a href='"+request.getContextPath()+"/profiles?name="+suggestions.getString(1)+"'><button class='btn btn-primary mt-3 mb-3'>View Profile</button></a>");
                      		out.println("   </div>");
                      		out.println("   <p class='card-text'>");
                      		out.println("    <small class='text-muted'>Lives In "+ suggestions.getString(5) +"</small>");
                      		out.println("   </p>");
                      		out.println("  </div>");
                      		out.println(" </div>");
                      		out.println("</div>");
                    	   i++;
                       }
                       db.closeConnections();
                       %>
                      </div>
                      <div class="container">
                        <div class="row">
                          <div class="col-12 text-center mt-4">
                            <a id="prev2" class="btn btn-outline-secondary mx-1 prev" href="javascript:void(0)" title="Previous">
                              <i class="fa fa-lg fa-chevron-left"></i>
                            </a>
                            <a id="next2" class="btn btn-outline-secondary mx-1 next" href="javascript:void(0)" title="Next">
                              <i class="fa fa-lg fa-chevron-right"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <hr>
                    <h3 class="text-center my-3 mb-4">Team Suggestions</h3>
                    <div id="myCarousel1" class="carousel slide" data-ride="carousel" style="width: 100%;">
                      <div id="carousel-inner1" class="carousel-inner row w-100 mx-auto">
                       <%
                       rs = db.getTeamSuggestions(username);
                       i=0;
                       while(rs.next()){
                    	   if(i==0){
                      			out.println("<div id="+ rs.getString(1) +" class='myclass1 carousel-item col-md-4 active'>");	
                      		}
                      		else{
                      			out.println("<div id="+ rs.getString(1) +" class='myclass1 carousel-item col-md-4'>");
                      		}
                      		out.println(" <div class='card'>");
                      		out.println("  <div class='card-body'>");
                      		out.println("   <div class='row d-flex justify-content-center'>");
                      		out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/teamProfilePics/"+rs.getString(1)+"' class='img-fluid rounded shadow' style='width: 150px;' alt='image'>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mt-3'>");
                      		out.println("    <h4 class='card-title'>"+rs.getString(1)+"</h4> ");
                      		
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-3'>");
                      		out.println("<span class='badge badge-pill badge-warning'>"+rs.getString(2)+"</span><br>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		out.println("   <p class='card-text'>"+rs.getString(3)+"</p>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-3'>");
                      		out.println("    <p class='card-text'>"+rs.getString(4)+"</p>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		out.println("    <a href='"+request.getContextPath()+"/team?name="+rs.getString(1)+"'><button class='btn btn-primary mt-3 mb-3'>View Team</button></a>");
                      		out.println("   </div>");
                      		
                      		out.println("  </div>");
                      		out.println(" </div>");
                      		out.println("</div>");
                    	   i++;
                       }
                       if(i==0){%>
                	   <div class="row justify-content-center mb-3" style="width:100%;">
                       <div class="col-lg-9">
                         <p>You do not have any teams yet! Please Join a Team!</p>
                       </div>
                     </div>
                  <% }
                   %>
                      
                      </div>
                      <div class="container">
                        <div class="row">
                          <div class="col-12 text-center mt-4">
                            <a id="prev1" class="btn btn-outline-secondary mx-1 prev" href="javascript:void(0)" title="Previous">
                              <i class="fa fa-lg fa-chevron-left"></i>
                            </a>
                            <a id="next1" class="btn btn-outline-secondary mx-1 next" href="javascript:void(0)" title="Next">
                              <i class="fa fa-lg fa-chevron-right"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                    
    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
      </div>
      </section>
    </div>
    
  </main>
  <footer class="footer">
    <div class="container">
      <div class="row row-grid align-items-center">
        <div class="col-lg-6">
          <h4 class="mb-0 font-weight-light">Let's get in touch on any of these platforms.</h4>
        </div>
        <div class="col-lg-6 text-lg-center btn-wrapper">
          <a target="_blank" href="https://twitter.com/creativetim" class="btn btn-neutral btn-icon-only btn-twitter btn-round btn-lg" data-toggle="tooltip" data-original-title="Follow us">
            <i class="fa fa-twitter"></i>
          </a>
          <a target="_blank" href="https://www.facebook.com/creativetim" class="btn btn-neutral btn-icon-only btn-facebook btn-round btn-lg" data-toggle="tooltip" data-original-title="Like us">
            <i class="fa fa-facebook-square"></i>
          </a>
          <a target="_blank" href="https://dribbble.com/creativetim" class="btn btn-neutral btn-icon-only btn-dribbble btn-lg btn-round" data-toggle="tooltip" data-original-title="Follow us">
            <i class="fa fa-dribbble"></i>
          </a>
          <a target="_blank" href="https://github.com/creativetimofficial" class="btn btn-neutral btn-icon-only btn-github btn-round btn-lg" data-toggle="tooltip" data-original-title="Star on Github">
            <i class="fa fa-github"></i>
          </a>
        </div>
      </div>
    </div>
  </footer>
  
  
  <script src='https://unpkg.com/jquery@3.3.1/dist/jquery.js'></script>
  <script src='https://unpkg.com/popper.js@1.12.9/dist/umd/popper.js'></script>
  <script src='https://unpkg.com/bootstrap@4.0.0/dist/js/bootstrap.js'></script>
  
  <!-- Core -->
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/popper/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/headroom/headroom.min.js"></script>
  <!-- Optional JS -->
  <script src="${pageContext.request.contextPath}/assets/vendor/onscreen/onscreen.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/nouislider/js/nouislider.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <!-- Argon JS -->
  <script src="${pageContext.request.contextPath}/assets/js/argon.js?v=1.1.0"></script>

  <script src='https://unpkg.com/jquery@3.3.1/dist/jquery.js'></script>
<script src='https://unpkg.com/popper.js@1.12.9/dist/umd/popper.js'></script>
<script src='https://unpkg.com/bootstrap@4.0.0/dist/js/bootstrap.js'></script>
<script  src="${pageContext.request.contextPath}/assets/cardscript.js"></script>

<script >
(function($) {
	  "use strict";
	  // Auto-scroll
	  $("#myCarousel1").carousel({
	    interval: 5000
	  });
	  
	  $("#myCarousel2").carousel({
		 interval: 5000
	  });


	  // Control buttons
	  $("#next1").click(function() {
	    $("#myCarousel1").carousel("next");
	    return false;
	  });
	  $("#prev1").click(function() {
	    $("#myCarousel1").carousel("prev");
	    return false;
	  });

	// Control buttons
	  $("#next2").click(function() {
	    $("#myCarousel2").carousel("next");
	    return false;
	  });
	  $("#prev2").click(function() {
	    $("#myCarousel2").carousel("prev");
	    return false;
	  });
	  
	  // On carousel scroll
	  $("#myCarousel1").on("slide.bs.carousel", function(e) {
	    var $e = $(e.relatedTarget);
	    var idx = $e.index();
	    var itemsPerSlide = 3;
	    var totalItems = $(".myclass1").length;
	    if (idx >= totalItems - (itemsPerSlide - 1)) {
	      var it = itemsPerSlide - (totalItems - idx);
	      for (var i = 0; i < it; i++) {
	        // append slides to end
	        if (e.direction == "left") {
	          $(".myclass1")
	            .eq(i)
	            .appendTo("#carousel-inner1");
	        } else {
	          $(".myclass1")
	            .eq(0)
	            .appendTo("#carousel-inner1");
	        }
	      }
	    }
	  });
	  
	// On carousel scroll
	  $("#myCarousel2").on("slide.bs.carousel", function(e) {
	    var $e = $(e.relatedTarget);
	    var idx = $e.index();
	    var itemsPerSlide = 3;
	    var totalItems = $(".myclass2").length;
	    if (idx >= totalItems - (itemsPerSlide - 1)) {
	      var it = itemsPerSlide - (totalItems - idx);
	      for (var i = 0; i < it; i++) {
	        // append slides to end
	        if (e.direction == "left") {
	          $(".myclass2")
	            .eq(i)
	            .appendTo("#carousel-inner2");
	        } else {
	          $(".myclass2")
	            .eq(0)
	            .appendTo("#carousel-inner2");
	        }
	      }
	    }
	  });
	})(jQuery);

</script>


</body>

</html>