<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<div style="    margin: 0px auto;
    width: 1200px;
    text-align: center;
    padding-top: 100px;">
    <header class="mb-3 d-flex justify-content-between">
    	<h3>QuietKids</h3>
    	<div class="  p-1">
    	
    		<h4><i class="fas fa-user-circle"></i> Logged in: <c:out value="${user.name}" /></h4>
    	</div>
    	
    </header>
    	<a href="/logout"  class="btn btn-sm btn-primary" style="margin-left:1000px; ">Logout</a>
    



	<h1  class="h3 mb-3 font-weight-normal" style="margin-left:-1000px;">Song Board:</h1>
			<a href="/ideas/highest">Top Songs</a>
			
	
	
				
				
				
				<!-- <h2 scope="col">Like/Unlike song</h2> -->

			<c:forEach items="${ideas}" var="idea">
                <div class="card mb-3">
                    <div class="card-header d-flex justify-content-between">
                      <a href="/ideas/${idea.id}">Post</a>
                        <c:if test="${! idea.users.contains(user)}">
                            <a href="/ideas/${idea.id}/like"> <i class="fas fa-thumbs-up fa-2x"> Like</i></a>
                        </c:if>
                        <c:if test="${idea.users.contains(user)}">
                            <a href="/ideas/${idea.id}/Unlike"><i class="fas fa-thumbs-down fa-2x"> Unlike</i></a>
                        </c:if>
                    </div>
                    <div class="card-body">
                      <blockquote class="blockquote mb-0">
                        <a href="/ideas/${idea.id}"><h2 scope="col"><i class="fas fa-music"></i> Song: <c:out value="${idea.title}" /></a></h2> 
                        
                        <h2 scope="col"><i class="fas fa-user"></i> Artist: <c:out value="${idea.artist}" /></h2>
                        <h2 scope="col"><i class="fas fa-compact-disc"></i> Album: <c:out value="${idea.album}" /></h2>
                        <h2 scope="col">Likes: <c:out value="${idea.likes}" /></h2>


                        <footer class="blockquote-footer"><h2 scope="col">Posted By: <c:out value="${idea.createdBy}" /></h2></footer>

                      </blockquote>
                    </div>
                    <div class="event-details-side">
				<h3>Comments</h3>
				<div class="messages">
				<c:forEach items="${ idea.messages }" var="message">
					<p>${ message.author.name } says: ${ message.content }</p>
				</c:forEach>
				</div>
				<form class="w-50 p-3" action="/ideas" method="post">
					<div class="form-group">
						<label for="comment">Add Comment</label>
						<span>${ error }</span>
						<textarea name="comment" id="comment" class="form-control mb-3"></textarea>
						<button>Submit</button>
					</div>
				</form>
			</div>
                  </div>
				

				
			</c:forEach>
	<a href="/ideas/new" class="btn btn-lg btn-primary" >Post A Song</a>
	</div>
</body>
</html>