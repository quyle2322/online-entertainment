<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <header class="row">
			<%@include file="/views/user/layout/header.jsp" %>
		</header><br>
	<div class="panel panel-default" style="border: 1px solid orange;width: 500px; margin: 0 auto;">
        <div class="panel-heading">FORGOT PASSWORD</div>
        <div class="panel-body">
            <form action="/Day5/cookie" method="post">
                <div>
                    <label>Username:</label><br>
                    <input name="username"><br>
                </div>
                <div>
                    <label>Email:</label><br>
                    <input name="email" type="text">
                </div>
              </form>
        </div>
        <div class="panel-footer">
            <button>Retrieve</button>
        </div>
      </div>