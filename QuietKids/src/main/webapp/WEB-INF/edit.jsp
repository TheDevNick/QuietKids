<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<meta charset="ISO-8859-1">
	<title>Edit <c:out value="${song.title}"></c:out>
	</title>
</head>

<body></body>
<div>
	<a href="/logout" class="btn btn-sm btn-primary" style="margin-left:1000px; ">Logout</a>
	<a href="/songs" class="btn btn-sm btn-primary" style="margin-left:1000px; ">Dashboard</a>
	<h1 class="h3 mb-3 font-weight-normal">
		Edit
		<c:out value="${song.title}" />
	</h1>


	<p>
		<form:errors path="song.*" />
	</p>
	<form:form method="POST" action="/songs/${song.id}/edit" modelAttribute="song">
		<p>
			<form:label path="title">Content:</form:label>
			<form:input type="title" path="title" class="form-control" />
		</p>
		<input type="submit" value="Update" class="btn btn-sm btn-primary " /> <br><br>
	</form:form>
	<form:form method="POST" action="/songs/${song.id}/delete">
		<input type="submit" value="Delete" class="btn btn-sm btn-danger " />
	</form:form>
</div>
</body>

</html>