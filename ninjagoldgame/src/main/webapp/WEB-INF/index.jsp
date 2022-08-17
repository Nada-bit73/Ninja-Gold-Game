<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Ninja Gold</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container justify-content-center">
		<label class="header" name="count">Your Gold :
		<c:out value="${currentCount}" /></label>
		<div class="row">
			<!--1st form-->
			<div class="col-md-3">
				<form method="POST" action="/process" class="text-center">
					<div>
						<input type="hidden" name="location" value="Farm">
						<h1>Farm</h1>
					</div>

					<p>( earns 10 - 20 gold )</p>
					<div class="justify-content-center">
						<button type="submit" value="Submit">Find Gold !</button>

					</div>
				</form>
			</div>
			<!--2nd form-->
			<div class="col-md-3">
				<form method="Post" action="/process" class="text-center">

					<div>
						<input type="hidden" name="location" value="Cave">
						<h1>Cave</h1>
					</div>

					<p>( earns 5 - 10 gold )</p>
					<div class="justify-content-center">
						<button type="submit" value="Submit">Find Gold !</button>
					</div>
				</form>
			</div>
			<!--3rd form-->
			<div class="col-md-3">
				<form method="Post" action="/process" class="text-center">

					<div>
						<input type="hidden" name="location" value="House">
						<h1>House</h1>
					</div>
					<p>( earns 2 - 5 gold )</p>
					<div class="justify-content-center">
						<button type="submit" value="Submit">Find Gold !</button>
					</div>
				</form>
			</div>
			<!--4th form-->
			<div class="col-md-3">
				<form method="Post" action="/process" class="text-center">

					<div>
						<input type="hidden" name="location" value="Casino">
						<h1>Casino</h1>
					</div>

					<p>( earns/take 0 - 50 gold )</p>
					<div class="justify-content-center">
						<button type="submit" value="Submit">Find Gold !</button>
					</div>
				</form>
			</div>
			<!--end row-->
		</div>
		<div class="form-group">
			<label class="header">Activities :</label>
			<div style="overflow: scroll;" class="form-control" rows="7">
			<c:forEach items="${msg}" var="myMsg">
					<p class="${myMsg.contains("faild") ? "red":"green"}">
						<c:out value="${myMsg}" />
					</p>
			</c:forEach>
            </div>
		</div>

	</div>
</body>
</html>