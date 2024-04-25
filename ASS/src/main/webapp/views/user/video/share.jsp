<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@include file="/views/user/layout/header.jsp"%>
<form action="${ctx}/poly/user/share" method="post">
<div class="panel panel-default"
	style="border: 1px solid orange; width: 500px; margin: auto">
	
		<div class="panel panel-default"
			style="border: 1px solid orange; width: 500px; margin: auto">
			<div class="panel-heading">SEND VIDEO TO YOUR FRIEND</div>
			<div class="panel-body">
				<label for="friendEmail">YOUR FRIEND'S EMAIL</label> <br> <input
					type="email" name="friendEmail" id="friendEmail"
					style="width: 90%;" required>
			</div>
			<div class="panel-footer">
				<button type="submit" class="btn btn-primary text-right">Send</button>
			</div>
		</div>


</div>
	</form>