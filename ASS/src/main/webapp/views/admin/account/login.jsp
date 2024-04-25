<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <header class="row">
			<%@include file="/views/user/layout/header.jsp" %>
		</header><br>
    <div class="panel panel-default" style="border: 1px solid orange;width: 500px; margin: 0 auto;">
        <div class="panel-heading">LOGIN</div>
            <form action="${ctx}/poly/user/login" method="post">
            	<div class="panel-body">
	            	<h5 style="color: red;">${message}</h5>
	                <div>
	                    <label>Username:</label><br>
	                    <input name="username" value="${username}"><br>
	                </div>
	                <div>
	                    <label>Password:</label><br>
	                    <input name="password"value="${password}" type="password">
	                </div>
	                  <div>
	                      <input type="checkbox"name="rememberme" value=true>
	                      Remember me?
	                  </div>
                  <div class="panel-footer">
            			<button>Login</button>
        			</div>                
              </form>
        </div>
        
      </div>