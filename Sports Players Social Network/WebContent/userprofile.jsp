<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.ks2334.Database,java.sql.*" %>

<%Database db = new Database(); %>
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
  <main class="profile-page">
    <section class="section-profile-cover section-shaped my-0">
      <!-- Circles background -->
      <div class="shape shape-style-1 shape-primary alpha-4">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
      <!-- SVG separator -->
      <div class="separator separator-bottom separator-skew">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-white" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </section>
    <div class="modal fade" id="modalFriends" tabindex="-1" role="dialog" aria-labelledby="modalFriends" aria-hidden="true">
            <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h6 class="modal-title" id="modal-title-default">Your Friends</h6>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <%
                  	ResultSet[] friends = db.getFriendsUser(username);
                  	while(friends[0].next()){
                  		out.println("<div class='alert alert-success alert-dismissible fade show' role='alert' style='background-color:rgba(255,255,255,0.2);border:0.01px solid rgba(0,0,0,0.1)'>");
                  		out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/profilePics/"+friends[0].getString(1)+"' class='img-fluid rounded shadow' style='width: 75px;' alt='image'>");
                  		out.println("<a href='"+request.getContextPath()+"/profiles?name="+friends[0].getString(1)+"' class='ml-4'><big style='font-size:1.2rem'>"+friends[0].getString(2)+" "+ friends[0].getString(3) +"</big></a>");
                  		out.println("</div>");
                  	}
                  	while(friends[1].next()){
                  		out.println("<div class='alert alert-success alert-dismissible fade show' role='alert' style='background-color:rgba(255,255,255,0.2);border:0.01px solid rgba(0,0,0,0.1)'>");
                  		out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/profilePics/"+friends[1].getString(1)+"' class='img-fluid rounded shadow' style='width: 75px;' alt='image'>");
                  		out.println("<a href='"+request.getContextPath()+"/profiles?name="+friends[1].getString(1)+"' class='ml-4'><big style='font-size:1.2rem'>"+friends[1].getString(2)+" "+ friends[1].getString(3) +"</big></a>");
                  		out.println("</div>");
                  	}
                  %>
	              
	            </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="broadcastMatch" tabindex="-1" role="dialog" aria-labelledby="broadcastMatch" aria-hidden="true">
              <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-body p-0">
                    <div class="card bg-secondary shadow border-0">
                      <div class="card-header bg-white pb-2">
                        <div class="text-muted text-center mb-1">
                          <h5>Broadcast Match Request</h5>
                        </div>
                      </div>
                      <div class="card-body px-lg-5 py-lg-5">
                        <form id="broadcastForm">
                          <div class="form-group">
		                      <big>Date: &nbsp</big>
		                      <input type="date" name="matchDate"
						       placeholder="yyyy-mm-dd"
						       data-date-format="YYYY MMMM DD">
		                  </div>
		                  <div class="form-group">
		                      <big>Time: &nbsp</big>
		                      <input type="text" placeholder="hh:mm"  name="matchTime">
		                  </div>
                          <div class="form-group">
		                      <select name="sportName" form="broadcastForm" style="width:100%;">
		                      	  <option>Select Sport</option>
		                      	  <%
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
		                      <select name="venueName" form="broadcastForm" style="width:100%;">
		                      	  <option>Select Venue</option>
		                      	  <%
		                      	  	rs = db.getVenues();
		                      	  	String venueName,venueAddress;
		                      	  	while(rs.next()){
		                      	  		venueName = rs.getString(1);
		                      	  		venueAddress = rs.getString(2);
		                      	  		out.println("<option value="+venueName+">"+venueName+", "+venueAddress+"</option>");
		                      	  	}
		                      	  %>
								</select>
		                  </div>		                   
                         </form>
                         <div class="text-center">
		                    <%
		                    	out.println("<button onclick='broadcastMatchRequest(\""+username+"\")' class='btn btn-primary my-4'>Send Request</button>");
		                    %>
		                  </div>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
    <section class="section">
      <div class="container">
        <div class="card card-profile shadow mt--500" style="margin-top: -400;">
          <div class="px-4">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                  <%
                  	out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/profilePics/"+username+"' class='rounded-circle' alt='image'>");
                  %>
                    
                  </a>
                </div>
              </div>
              <div class="col-lg-4 order-lg-3 text-lg-right align-self-lg-center">
                <div class="card-profile-actions py-4 mt-lg-0">
                  <a href="${pageContext.request.contextPath}/createTeam" class="btn btn-sm btn-default mr-4">New Team</a>
                  <button class="btn btn-sm btn-info float-right" data-toggle="modal" data-target="#broadcastMatch">Find New Match</button>
 
                </div>
              </div>
              <div class="col-lg-4 order-lg-1">
              	<%
              		
              		int a[] = new int[4];
              		a = db.getUserStats(username);
              	%>
                <div class="card-profile-stats d-flex justify-content-center">
                <button style="display:none" id="buttonFriends" type="button" class="btn btn-block btn-primary mb-3" data-toggle="modal" data-target="#modalFriends"></button>
                 <div id="friends" style="cursor:pointer">
                 	<span class="heading"><%out.println(a[0]); %></span>
                    <span class="description">Friends</span>
                 </div>
                  
                  <div>
                    <span class="heading"><%out.println(a[2]); %></span>
                    <span class="description">Matches</span>
                  </div>
                  <div>
                    <span class="heading"><%out.println(a[3]); %></span>
                    <span class="description">Wins</span>
                  </div>
                  <div>
                    <span class="heading"><%out.println(a[1]); %></span>
                    <span class="description">Level</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="text-center mt-5">
            <%
            	rs = db.getUserData(username);
	            String uname = "";
	    		String fname =  "";
	    		String lname =  "";
	    		String address =  "";
	    		String email =  "";
	    		long phone = 0;
	    		String description =  "";
            	if(rs.next()){
            		uname = rs.getString(1);
            		fname = rs.getString(2);
            		lname = rs.getString(3);
            		address = rs.getString(4);
            		email = rs.getString(5);
            		phone = rs.getLong(6);
            		description = rs.getString(7);
            	}
            %>
              <h3><%out.println(uname); %><span class="font-weight-light">, 20</span></h3>
              <h5><%out.println(fname+" "+lname); %></h5>
              <div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i><%out.println(address); %></div>
              <div class="h6 mt-4"><i class="ni business_briefcase-24 mr-2"></i>Email - <%out.println(email); %></div>
              <div><i class="ni education_hat mr-2"></i>Phone - <%out.println(phone); %></div>
            </div>
            <div class="mt-5 py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
                 <b>Description</b>
           	  	  <p><%out.println(description); %></p>
                </div>
              </div>
              
              <div class="row justify-content-center mt-3">
                <b>Your Sports</b>
              </div>
              <div class="row justify-content-center mt-3">
                <%
	              	rs = db.getUserSports(username);
	              	while(rs.next()){
	              		out.println("<span class='badge badge-pill badge-warning m-2'>"+rs.getString(1)+"</span>");
	              	}
	            %>
              </div>
            </div>
            <div class="py-5 border-top text-center">
              <div class="row justify-content-center mb-3">
                <div class="col-lg-10">
                  <h3>Your Teams</h3>
                </div>
                
              </div>
              
              <div id="myCarousel1" class="carousel slide" data-ride="carousel" style="width: 100%;">
                      <div id="carousel-inner1" class="carousel-inner row w-100 mx-auto">
                       <%
                       rs = db.getUserTeams(username);
                       int i=0;
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
                      		out.println("    <img src='./assets/img/theme/team-4-800x800.jpg' alt='Raised circle image' class='img-fluid rounded shadow' style='width: 150px;'>");
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
            <div class="py-5 border-top text-center">
              <div class="row justify-content-center mb-3">
                <div class="col-lg-9">
                  <h3>Friend Requests</h3>
                </div>
              </div>
             <div id="myCarousel2" class="carousel slide" data-ride="carousel" style="width: 100%;">
                      <div id="carousel-inner2" class="carousel-inner row w-100 mx-auto">
                       <%
                       ResultSet friendRequests;
                       friendRequests = db.getFriendRequests(username);
                       i=0;
                       while(friendRequests.next()){
                    	   if(i==0){
                      			out.println("<div id=" + friendRequests.getString(1) + " class='myclass2 carousel-item col-md-4 active'>");	
                      		}
                      		else{
                      			out.println("<div id=" + friendRequests.getString(1) + " class='myclass2 carousel-item col-md-4'>");
                      		}
                      		out.println(" <div class='card'>");
                      		out.println("  <div class='card-body'>");
                      		out.println("   <div class='row d-flex justify-content-center'>");
                      		//out.println("    <img src='./assets/img/theme/team-4-800x800.jpg' alt='Raised circle image' class='img-fluid rounded shadow' style='width: 150px;'>");
                      		out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/profilePics/"+friendRequests.getString(1)+"' class='img-fluid rounded shadow' style='width: 150px;' alt='image'>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mt-3'>");
                      		out.println("    <a href='"+request.getContextPath()+"/profiles?name="+friendRequests.getString(1)+"'><h5 class='card-title'>"+friendRequests.getString(1)+"</h5></a> ");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center'>");
                      		out.println("    <h5 class='card-title'>"+friendRequests.getString(2)+" " +friendRequests.getString(3)+"</h5> ");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		out.println("    <div class='col-lg-5'>");
                      		out.println("     <button onclick='acceptFriendRequest(\""+friendRequests.getString(1)+"\")' class='btn btn-primary mt-3 mb-3'>Accept Request</button>");
                      		out.println("    </div>");
                      		out.println("    <div class='col-lg-5'>");
                      		out.println("    <button onclick='declineFriendRequest(\""+friendRequests.getString(1)+"\")' class='btn btn-danger mt-3 mb-3'>Decline Request</button>");
                      		out.println("    </div>");
                      		out.println("   </div>");
                      		out.println("  </div>");
                      		out.println(" </div>");
                      		out.println("</div>");
                    	    i++;
                       }
                       
                       if(i==0){%>
                    	   <div class="row justify-content-center mb-3" style="width:100%;">
                           <div class="col-lg-9">
                             <p>You do not have any friends yet! Please Add Some Friends!</p>
                           </div>
                         </div>
                      <% }
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
            </div>
            <div class="py-5 border-top text-center">
              <div class="row justify-content-center mb-3">
                <div class="col-lg-9">
                  <h3>Match Requests</h3>
                </div>
              </div>
              <div id="myCarousel3" class="carousel slide" data-ride="carousel" style="width: 100%;">
                      <div id="carousel-inner3" class="carousel-inner row w-100 mx-auto">
                       <%
                       ResultSet matchRequests;
                       matchRequests = db.getUserMatchRequests(username);
                       i=0;
                       int matchId;
                       String user1,user2,sport,venue,matchDate,matchTime;
                       while(matchRequests.next()){
                    	   matchId = matchRequests.getInt(1);
                    	   user1 = matchRequests.getString(2);
                    	   user2 = matchRequests.getString(3);
                    	   sport = matchRequests.getString(4);
                    	   venue = matchRequests.getString(5)+", "+matchRequests.getString(6);
                    	   matchDate = matchRequests.getString(7).split(" ")[0];
                    	   matchTime = matchRequests.getString(7).split(" ")[1];
                    	   if(i==0){
                      			out.println("<div id=" + matchId + " class='myclass3 carousel-item col-md-4 active'>");	
                      		}
                      		else{
                      			out.println("<div id=" + matchId + " class='myclass3 carousel-item col-md-4'>");
                      		}
                      		out.println(" <div class='card'>");
                      		out.println("  <div class='card-body'>");
                      		out.println("   <div class='row d-flex justify-content-center'>");
                      		//out.println("    <img src='./assets/img/theme/team-4-800x800.jpg' alt='Raised circle image' class='img-fluid rounded shadow' style='width: 150px;'>");
                      		out.println("<img onerror=\"this.src='./assets/img/theme/team-4-800x800.jpg'\" src='"+request.getContextPath()+"/assets/media/profilePics/"+user1+"' class='img-fluid rounded shadow' style='width: 150px;' alt='image'>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mt-3'>");
                      		if(user2==null){
                      			out.println("    <a href='"+request.getContextPath()+"/profiles?name="+user1+"'><h5 class='card-title'>"+user1+" (B)</h5></a> ");
                      		}
                      		else{
                      			out.println("    <a href='"+request.getContextPath()+"/profiles?name="+user1+"'><h5 class='card-title'>"+user1+"</h5></a> ");
                      		}
                      		
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-3'>");
                      		out.println("<span class='badge badge-pill badge-warning'>"+sport+"</span><br>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		out.println("   <p class='card-text'>Venue: "+venue+"</p>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-3'>");
                      		out.println("    <p class='card-text'>Date: "+matchDate+"</p>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-3'>");
                      		out.println("    <p class='card-text'>Time: "+matchTime+"</p>");
                      		out.println("   </div>");
                      		out.println("   <div class='row d-flex justify-content-center mb-2'>");
                      		if(user2==null){
                      			out.println("    <div class='col-lg-5'>");
                          		out.println("     <button onclick='acceptMatchRequest(\""+matchId+"\",true)' class='btn btn-primary mt-3 mb-3'>Accept Request</button>");
                          		out.println("    </div>");
                          		out.println("    <div class='col-lg-5'>");
                          		out.println("    <button onclick='declineMatchRequest(\""+matchId+"\",true)' class='btn btn-danger mt-3 mb-3'>Decline Request</button>");
                          		out.println("    </div>");
                      		}
                      		else{
                      			out.println("    <div class='col-lg-5'>");
                          		out.println("     <button onclick='acceptMatchRequest(\""+matchId+"\",false)' class='btn btn-primary mt-3 mb-3'>Accept Request</button>");
                          		out.println("    </div>");
                          		out.println("    <div class='col-lg-5'>");
                          		out.println("    <button onclick='declineMatchRequest(\""+matchId+"\",false)' class='btn btn-danger mt-3 mb-3'>Decline Request</button>");
                          		out.println("    </div>");
                      		}
                      		out.println("   </div>");
                      		out.println("  </div>");
                      		out.println(" </div>");
                      		out.println("</div>");
                    	    i++;
                       }
                       
                       if(i==0){%>
                    	   <div class="row justify-content-center mb-3" style="width:100%;">
                           <div class="col-lg-9">
                             <p>You do not have any Match Requests yet!</p>
                           </div>
                         </div>
                      <% }
                       %>
                      </div>
                      <div class="container">
                        <div class="row">
                          <div class="col-12 text-center mt-4">
                            <a id="prev3" class="btn btn-outline-secondary mx-1 prev" href="javascript:void(0)" title="Previous">
                              <i class="fa fa-lg fa-chevron-left"></i>
                            </a>
                            <a id="next3" class="btn btn-outline-secondary mx-1 next" href="javascript:void(0)" title="Next">
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
    </section>
    <p style="display:none" id="context">${pageContext.request.contextPath}</p>
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

	  $("#myCarousel3").carousel({
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
	  
	// Control buttons
	  $("#next3").click(function() {
	    $("#myCarousel3").carousel("next");
	    return false;
	  });
	  $("#prev3").click(function() {
	    $("#myCarousel3").carousel("prev");
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
	
	// On carousel scroll
	  $("#myCarousel3").on("slide.bs.carousel", function(e) {
	    var $e = $(e.relatedTarget);
	    var idx = $e.index();
	    var itemsPerSlide = 3;
	    var totalItems = $(".myclass3").length;
	    if (idx >= totalItems - (itemsPerSlide - 1)) {
	      var it = itemsPerSlide - (totalItems - idx);
	      for (var i = 0; i < it; i++) {
	        // append slides to end
	        if (e.direction == "left") {
	          $(".myclass3")
	            .eq(i)
	            .appendTo("#carousel-inner3");
	        } else {
	          $(".myclass2")
	            .eq(0)
	            .appendTo("#carousel-inner3");
	        }
	      }
	    }
	  });
	})(jQuery);

</script>

 <script>
	function acceptFriendRequest(username){
		$.ajax({url: document.getElementById("context").innerHTML+"/utility?type=AcceptFriendRequest&user="+username, success: function(result){
	    	if(result==="200"){
	    		if(document.getElementById(username).classList.contains("active")){
	    			document.getElementById("next2").click();
	    		}
	    		document.getElementById(username).remove();
	    		alert("Friend Request Accepted");
	    	}
	    	else{
	    		alert("Request Failed!Please Try Again Later!");
	    	}
	  	}});
	}
	
	function declineFriendRequest(username){
		$.ajax({url: document.getElementById("context").innerHTML+"/utility?type=DeclineFriendRequest&user="+username, success: function(result){
			if(result==="200"){
	    		if(document.getElementById(username).classList.contains("active")){
	    			document.getElementById("next2").click();
	    		}
	    		document.getElementById(username).remove();
	    		alert("Friend Request Declined");
	    	}
			else{
	    		alert("Request Failed!Please Try Again Later!");
	    	}
	  	}});
	}
	
	function acceptMatchRequest(matchId,isNull){
		$.ajax({url: document.getElementById("context").innerHTML+"/utility?type=AcceptUserMatchRequest&matchId="+matchId+"&isNull="+isNull, success: function(result){
			if(result==="200"){
	    		if(document.getElementById(matchId).classList.contains("active")){
	    			document.getElementById("next3").click();
	    		}
	    		document.getElementById(matchId).remove();
	    		alert("Match Request Accepted");
	    	}
			else{
	    		alert("Request Failed!Please Try Again Later!");
	    	}
	  	}});
	}
	
	function declineMatchRequest(matchId,isNull){
		$.ajax({url: document.getElementById("context").innerHTML+"/utility?type=DeclineUserMatchRequest&matchId="+matchId+"&isNull="+isNull, success: function(result){
			if(result==="200"){
	    		if(document.getElementById(matchId).classList.contains("active")){
	    			document.getElementById("next3").click();
	    		}
	    		document.getElementById(matchId).remove();
	    		alert("Match Request Declined");
	    	}
			else{
	    		alert("Request Failed!Please Try Again Later!");
	    	}
	  	}});
	}
	
	function broadcastMatchRequest(username){
		  form = document.getElementById("broadcastForm");
		  var sport = form["sportName"].value;
		  var venue = form["venueName"].value;
		  var date = form["matchDate"].value;
		  var time = form["matchTime"].value;
		  var dataString = "type=BroadcastMatchRequest&sportName="+ sport + "&venueName=" + venue + "&matchDateTime=" + date+" "+time;
		  console.log("Data String: ",dataString);
		  $.ajax({
		    type: "POST",
		    url: document.getElementById("context").innerHTML+"/utility",
		    data: dataString,
		    success: function(result) {
		      if(result==="200"){
		    	  alert("Match Request Sent!");  
		      }
		      else{
		    	  alert("Match Request Could Not Be Sent!")
		      }
		    }
		  });
		  
	}
 </script>
 
 <script>
 	document.getElementById("friends").onclick = function(){
 		document.getElementById("buttonFriends").click();
 	}
 </script>
</body>

</html>