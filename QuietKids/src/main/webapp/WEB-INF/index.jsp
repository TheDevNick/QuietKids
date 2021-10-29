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
			<h3 class="col-8">QuietKids</h3>
			<div class="row">
				<h4><i class="fas fa-user-circle"></i> Logged in:
					<c:out value="${user.name}" />
				</h4>
				<a href="/logout" class="btn btn-sm btn-primary">Logout</a>
			</div>
		</nav>

		<h1>Song Board:</h1>
		<a href="/songs/highest">Top Songs</a>
		<!-- <h2 scope="col">Like/Unlike song</h2> -->
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-6">
					<c:forEach items="${songs}" var="song">
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
										<h2 scope="col"><i class="fas fa-music"></i> Song:
											<c:out value="${song.title}"/>
										</h2>
									</a>
									<h2 scope="col"><i class="fas fa-user"></i> Artist:
										<c:out value="${song.artist}" />
									</h2>
									<h2 scope="col"><i class="fas fa-compact-disc"></i> Album:
										<c:out value="${song.album}" />
									</h2>
									<h2 scope="col">Likes:
										<c:out value="${song.likes}" />
									</h2>
									<footer class="blockquote-footer">
										<h2 scope="col">Posted By:
											<c:out value="${song.createdBy}" />
										</h2>
									</footer>
								</blockquote>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<a href="/songs/new" class="btn btn-lg btn-primary">Post A Song</a>
	</div>
	<a href="/songs/new" class="btn btn-lg btn-primary" >Post A Song</a>
</body>

</html>