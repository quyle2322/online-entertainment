<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
	<%@include file="/views/admin/layout/header.jsp" %> <br>
	 <div class="container">
	 <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#edit">VIDEO EDITION</a></li>
        <li><a data-toggle="tab" href="#list">VIDEO LIST</a></li>
    </ul>
    <div class="tab-content">
        <div id="edit" class="tab-pane fade in active">
            <form method="post">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-5">
                            <img src="<%= request.getContextPath() %>/views/posters/poster.jpg" alt="" style="width: 100%;">
                        </div>
                        <div class="col-md-7">
                            <label for="" >Youtube ID</label>
                            <input type="text" name="" id="" class="form-control">
                            <label for="">Video Title</label>
                            <input type="text" name="" id="" class="form-control">
                            <label for="">View Count</label>
                            <input type="text" name="" id="" class="form-control">
                            <input type="radio" id="option1" name="information" value="option1" style="margin-top: 10px;">
                            <label for="option1">Active</label>
                    
                            <input type="radio" id="option2" name="information" value="option2">
                            <label for="option2">Inactive</label><br>
                            
                        </div>
                    </div>
                    <div class="panel-footer">
	                    <div class="text-right">
	                        <button formaction="/AsmGuide/adm/oe/video/create" class="btn btn-default">Create</button>
	                        <button formaction="/AsmGuide/adm/oe/video/update" class="btn btn-default">Update</button>
	                        <button formaction="/AsmGuide/adm/oe/video/delete" class="btn btn-default">Delete</button>
	                        <button formaction="/AsmGuide/adm/oe/video/reset" class="btn btn-default">Reset</button>
	                    </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="list" class="tab-pane fade">
            <div class="panel panel-default">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Youtube Id</th>
                            <th>Video Title</th>
                            <th>View Count</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
  	