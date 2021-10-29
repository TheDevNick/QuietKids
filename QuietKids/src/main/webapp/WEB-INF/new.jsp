<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<meta charset="ISO-8859-1">
	<title>Share Song</title>
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
		<h1 class="h3 mb-3 font-weight-normal">Share Song</h1>
		<div class="card">
			<div class="card-body">
				<p>
					<form:errors path="song.*" />
				</p>
				<form:form method="POST" action="/songs/new" modelAttribute="song">
					<div class="form-group">
						<form:label path="title">Title:</form:label>
						<form:input type="title" path="title" class="form-control" />
					</div>
		
					<div class="form-group">
						<form:label path="artist">Artist:</form:label>
						<form:input type="artist" path="artist" class="form-control" />
					</div>
		
					<div class="form-group">
						<form:label path="album">Album:</form:label>
						<form:input type="album" path="album" class="form-control" />
					</div>
		
					<div class="form-group">
						<form:label path="description">Description:</form:label>
						<form:input type="description" path="description" class="form-control" />
					</div>	
					<input type="submit" value="Create" class="btn btn-lg btn-primary " />
				</form:form>
			</div>
		</div>
	</div>
</body>

</html>