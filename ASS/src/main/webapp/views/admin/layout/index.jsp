<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <style>
    td,th{
        border: 1px solid #ddd;
        padding: 8px;
    }
</style>
	<%@include file="/views/admin/layout/header.jsp" %> <br>
	 <div class="container">
	 <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#edit">VIDEO EDITION</a></li>
        <li><a data-toggle="tab" href="#list">VIDEO LIST</a></li>
    </ul>
    <div class="tab-content">
        <div id="edit" class="tab-pane fade in active">
            <form method="post"enctype="multipart/form-data">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-5">
                           <img src="${pageContext.request.contextPath}/views/images/${video.poster}" style="width:100%">
                        </div>
                        <div class="col-md-7">	
                            <label for="" >Youtube ID</label>
                            <input type="text" name="id" id="" class="form-control" value="${video.id}">
                            <label for="">Video Title</label>
                            <input type="text" name="title" id="" class="form-control"value="${video.title}">
                            <label for="">Description</label>
                            <input type="text" name="description" id="" class="form-control"value="${video.description}">
                             <label for="" >View Count</label>
                            <input type="text" name="views" id="" class="form-control"value="${video.views}">
                            <label for="">Poster: ${video.poster}</label>
	                           <div>
							        <input name="poster" value="${video.poster}" type="hidden">
							        <input name="poster_file" type="file">
							    </div>
						     <div>
						        Role: <br>
						        <input ${video.active?'checked':''} name="active" type="radio" value="true"> Active
						        <input ${video.active?'':'checked'} name="active" type="radio" value="false"> Inactive
						    </div>
                            
                        </div>
                    </div>
                    <div class="panel-footer">
	                    <div class="text-right">
	                        <button formaction="${ctx}/poly/admin/video/create" class="btn btn-default">Create</button>
	                        <button formaction="${ctx}/poly/admin/video/update" class="btn btn-default">Update</button>
	                        <button formaction="${ctx}/poly/admin/video/delete" class="btn btn-default">Delete</button>
	                        <button formaction="${ctx}/poly/admin/video/reset" class="btn btn-default">Reset</button>
	                    </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="list" class="tab-pane fade">
            <div class="panel panel-default">
            	  
	                <table class="table" style="border: 1px solid #ddd;">
	                    <thead>
	                        <tr>
	                            <th>Video Id</th>
	                            <th>Video Title</th>
	                            <th>Description</th>
	                            <th>View Count</th>
	                            <th>Poster</th>
	                            <th>Status</th>
	                            <th>Action</th>
	                        </tr>
	                    </thead>
	                    <c:forEach var="v" items="${videos}">
	                    <tbody>
	                        <tr>
	                      
	                            <td>${v.id}</td>
	                            <td>${v.title}</td>
	                            <td>${v.description}</td>
	                            <td>${v.views}</td>
	                            <td>${v.poster}</td>
	                            <td>${v.active?'Active':'Inactive'}</td>  
 								<td>
									 <a href="${ctx}/poly/admin/video/edit/${v.id}" class="btn btn-default">Edit</a>
								</td>
	                        </tr>
	                    </tbody>
	                    </c:forEach>
	                </table>
               
            </div>
        </div>
    </div>
</div>
  	