<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>New Idea</title>
</head>
<body>
	<div style="    margin: 0px auto;
    width: 1200px;
    text-align: center;
    padding-top: 100px;">
        <a href="/logout"  class="btn btn-sm btn-primary" style="margin-left:1000px; ">Logout</a>
    <a href="/ideas"  class="btn btn-sm btn-primary" style="margin-left:1000px; ">Dashboard</a>
	<h1 class="h3 mb-3 font-weight-normal">New Idea</h1>

	<p>
		<form:errors path="idea.*" />
	</p>
	<form:form method="POST" action="/ideas/new" modelAttribute="idea">
		<p>
			<form:label path="title">Content:</form:label>
			<form:input type="title" path="title"  class="form-control" />
			
			<form:label path="artist">Artist:</form:label>
			<form:input type="artist" path="artist"  class="form-control" />
			
			<form:label path="album">Album:</form:label>
			<form:input type="album" path="album"  class="form-control" />
		</p>
		<input type="submit" value="Create" class="btn btn-lg btn-primary "/>
	</form:form>
	</div>
</body>
</html>