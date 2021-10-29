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
	<title>Dashboard</title>
</head>

<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<h3 class="col">QuietKids</h3>
			<div class="col-sm">
				<form action="/search" method="POST">
					<input type="search" name="artist" /> 
					<input type="submit" value="Search Artists" />
				</form>
			</div>
			<div class="col">
				<h4><i class="fas fa-user-circle"></i> Logged in:
					<a href="/profile"><c:out value="${user.name}" /></a>
				</h4>
				<a href="/logout" class="btn btn-sm btn-primary">Logout</a>
			</div>
		</nav>
		<h1>Song Board:</h1>
		<div class="container">
			<a href="/songs/highest">Top Songs</a>
		<div class="row">

		</div>
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
					<div class="carousel-item active">
						<c:forEach items="${songs}" var="song">
							<div class="col">
								<div class="card mb-3">
									<div class="card-header d-flex justify-content-between">
										<a href="/songs/${song.id}">Post</a>
										<c:if test="${! song.users.contains(user)}">
											<a href="/songs/${song.id}/like"> <i class="fas fa-thumbs-up fa-1x"> Like</i></a>
										</c:if>
										<c:if test="${song.users.contains(user)}">
											<a href="/songs/${song.id}/Unlike"><i class="fas fa-thumbs-down fa-1x"> Unlike</i></a>
										</c:if>
									</div>
									<div class="card-body">
										<blockquote class="blockquote mb-0">
											<a href="/songs/${song.id}">
												<h4 scope="col"><i class="fas fa-music"></i> Song:
													<c:out value="${song.title}"/>
												</h4>
											</a>
											<h5 scope="col"><i class="fas fa-user"></i> Artist:
												<c:out value="${song.artist}" />
											</h5>
											<h5 scope="col"><i class="fas fa-compact-disc"></i> Album:
												<c:out value="${song.album}" />
											</h5>
											<h4 scope="col">Likes:
												<c:out value="${song.likes}" />
											</h4>
											<footer class="blockquote-footer">
												<h6 scope="col">Posted By:
													<c:out value="${song.createdBy}" />
												</h6>
											</footer>
										</blockquote>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				
			</div>
			<a class="carousel-control-prev" href="#trendingCarousel" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#trendingCarousel" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
		
				
		

</body>

</html>