<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
		integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
		crossorigin="anonymous" />
	<meta charset="ISO-8859-1">
	<title>
		<c:out value="${song.title}"></c:out>
	</title>
</head>

<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand navbar-light bg-light">
			<h3 class="col-8">QuietKids</h3>
			<div class="row justify-content-between">
				<div class="col-2">
					<a href="/songs" class="btn btn-sm btn-primary">Dashboard</a>
				</div> 
				<div class="col-2">
					<a href="/logout" class="btn btn-sm btn-primary">Logout</a>
				</div>
			</div>
		</nav>
		<div class="jumbotron">
			<div>
				<div class="d-flex justify-content-between">
					<h6 class="text-muted">
						<c:if test="${!song.createdBy.equals(user.name)}">
							Posted By:
							<c:out value="${song.createdBy}" />
						</c:if>
					</h6>	
					<c:if test="${! song.users.contains(user)}">
						<a href="/songs/${song.id}/like"> <i class="fas fa-thumbs-up fa-1x"> Like</i></a>
					</c:if>
					<c:if test="${song.users.contains(user)}">
						<a href="/songs/${song.id}/Unlike"><i class="fas fa-thumbs-down fa-1x"> Unlike</i></a>
					</c:if>
				</div>
				<div>
					<h4 class="dispaly-2">
						<c:out value="${song.title}" />
					</h4>
					<h6>
						By: 
						<c:out value="${song.artist}"/>
					</h6>
					<h6>
						Album:
						<c:out value="${song.album}"/>
					</h6>
					<p>
						<c:out value="${song.description}"/>
					</p>
					<hr>
					<div>
						<h6>Song Liked By:</h6>
						<ul>
							<c:forEach items="${song.users}" var="u">
								<li>
									<c:out value="${user.name}"/>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${ song.createdBy.equals(user.name)}">
			<a href="/songs/${song.id}/edit" class="btn btn-sm btn-primary">Edit</a>
		</c:if>
		<hr>
		<div class="col-6 ml-2 event-details-side">
			<h3>Comments</h3>
			<div class="messages">
				<c:forEach items="${song.comments}" var="comment">
					<p>${ comment.author.name } says: ${ comment.content }</p>
				</c:forEach>
			</div>
			<form class="w-50 p-3" action="/songs/${song.id}/comment" method="post">
				<div class="form-group">
					<label for="comment">Add Comment</label>
					<span>${error}</span>
					<textarea name="comment" id="comment" class="form-control mb-3"></textarea>
					<button>Submit</button>
				</div>
			</form>
		</div>

	</div>

</body>

</html>