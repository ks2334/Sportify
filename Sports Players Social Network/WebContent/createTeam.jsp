<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.ks2334.Database,java.sql.*" %>
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

</head>
<body>
  <header class="header-global">
    <nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
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
              <a href="${pageContext.request.contextPath}/home" class="nav-link" role="button">
                <i class="ni ni-ui-04 d-lg-none"></i>
                <span class="nav-link-inner--text">Home</span>
              </a>
            </li>
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
                %></span>
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
    <section class="section section-shaped section-lg">
      <div class="shape shape-style-1 bg-gradient-default">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <div class="container pt-lg-md">
        <div class="row justify-content-center">
          <div class="col-lg-9">
            <div class="card bg-secondary shadow border-0">
              
              <div class="card-body px-lg-5 py-lg-5 mb-5 pb-5 pt-5">
                <div class="text-center text-muted mb-5 mt-3">
                  <h2>Create Team</h2>
                </div>
                <div class="text-center text-muted mb-5 mt-3">
                  <%
                  	try{
                  		String errMsg = request.getAttribute("errMessage").toString();
                  		if(errMsg != null){
                  			out.println("<big style='color:red'>"+errMsg+"</big>");	
                  		}
                  	}catch(Exception e){}
                  %>
                </div>
                <form method="post" action="${pageContext.request.contextPath}/createTeam" id="createTeam" enctype = "multipart/form-data">
                 <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend ml-3">
                        <big>Team Profile Picture:&nbsp&nbsp</big>
                      </div>
                      <input type="file" accept="image/*" name="profilePic">
                    </div>
                  </div>
                <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="Team Name" type="name" name="teamName">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="Team Details" type="name" name="teamDetails">
                    </div>
                  </div>
                  <div class="form-group">
                      <select name="sportName" form="createTeam" style="width:100%;">
                      	  <option>Select Sport</option>
                      	  <%
                      	  	Database db = new Database();
                      	  	ResultSet rs = db.getSports();
                      	  	String sportName;
                      	  	while(rs.next()){
                      	  		sportName = rs.getString(1);
                      	  		out.println("<option value="+sportName+">"+sportName+"</option>");
                      	  	}
                      	  %>
						</select>
                  </div> 
                   <div class="form-group">
                    <div class="input-group input-group-alternative">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                      </div>
                      <input class="form-control" placeholder="Team Statistics" type="name" name="teamStats">
                    </div>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary my-4">Create Team</button>
                  </div>
                </form>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </section>
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
  
</body>

</html>