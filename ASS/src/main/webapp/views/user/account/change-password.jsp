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
        <div class="panel-heading">CHANGE PASSWORD</div>
        <div class="panel-body">
        
            <form action="${ctx}/poly/user/change-password" method="post">
            <h5 style="color: red;">${message}</h5>
                <div class="row">
                    <div class="col-md-6">
                        <label>Username:</label><br>
                        <input name="username" class="form-control"value="${user.id}"readonly ><br>
                    </div>
                    <div class="col-md-6">
                        <label>New Password:</label><br>
                        <input name="newpass" type="password" class="form-control"value="${param.newpass}">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Current Password:</label><br>
                        <input name="password" type="password" class="form-control"value="${param.password}">
                    </div>
                    <div class="col-md-6">
                        <label>Confirm New Password:</label><br>
                        <input type="password" name="confirm" class="form-control"value="${param.confirm}"><br>
                    </div>
                </div>
                <div class="panel-footer">
            		<button>Change</button>
        		</div>
            </form>
        </div>
        
      </div>