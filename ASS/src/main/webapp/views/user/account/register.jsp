<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <header class="row">
			<%@include file="/views/user/layout/header.jsp" %>
		</header><br>
	<div class="panel panel-default" style="border: 1px solid orange;width: 500px; margin: 0 auto;">
        <div class="panel-heading">REGISTRATION</div>
        <div class="panel-body">
             <form action="${ctx}/poly/user/register" method="post">
             	<h5 style="color: red;">${message}</h5>
                <div class="row">
                    <div class="col-md-6">
                        <label>Username:</label><br>
                        <input name="id" class="form-control"><br>
                    </div>
                    <div class="col-md-6">
                        <label>Email:</label><br>
                        <input name="email" type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
				<div class="col-md-6">
                        <label>Password:</label><br>
                        <input name="password" type="password" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>Fullname:</label><br>
                        <input name="fullname" class="form-control"><br>
                    </div>
                </div>
	                <div class="panel-footer">
	            <button>Sign Up</button>
	        </div>
            </form>
        </div>
        
      </div>