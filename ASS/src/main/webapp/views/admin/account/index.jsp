<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/views/admin/layout/header.jsp" %> <br>
  	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#edit">USER EDITION</a></li>
        <li><a data-toggle="tab" href="#list">USER LIST</a></li>
    </ul>

    <div class="tab-content">
        <div id="edit" class="tab-pane fade in active">
              <form method="post">
                <div class="row">
                    <div class="col-md-6" style="margin-top: 1px;"> 
                        <label>Username:</label><br>
                        <input name="id" class="form-control" value="${user.id}"><br>
                    </div>
                    <div class="col-md-6">
                        <label>Full name:</label><br>
                        <input name="fullname" type="text" class="form-control"value="${user.fullname}">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Password:</label><br>
                        <input name="password" type="password" class="form-control"value="${user.password}"> 
                        
                    </div>
                    <div class="col-md-6">
                        <label>Email</label><br>
                        <input type="text" name="email" class="form-control"value="${user.email}">
                        Role: <br>
			        <input ${user.admin?'checked':''} name="admin" type="radio" value="true"> Admin
			        <input ${user.admin?'':'checked'} name="admin" type="radio" value="false"> User 
                    </div>
                </div>
                <div class="panel-footer text-right">
                     <button formaction="${ctx}/poly/admin/user/create" class="btn btn-default">Create</button>
	                        <button formaction="${ctx}/poly/admin/user/update" class="btn btn-default">Update</button>
	                        <button formaction="${ctx}/poly/admin/user/delete" class="btn btn-default">Delete</button>
	                        <button formaction="${ctx}/poly/admin/user/reset" class="btn btn-default">Reset</button>
                </div>
            </form>
        </div>
        <div id="list" class="tab-pane fade">
            <div class="panel panel-default">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Full name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <c:forEach var="u" items="${users}">
                    <tbody>
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.password}</td>
                            <td>${u.fullname}</td>
                            <td>${u.email}</td>
                            <td>${u.admin?'Admin':'User'}</td>
                            <td>
									 <a href="${ctx}/poly/admin/user/edit/${u.id}" class="btn btn-default">Edit</a>
								</td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>