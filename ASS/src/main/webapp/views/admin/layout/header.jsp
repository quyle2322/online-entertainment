<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <c:set var="ctx" value="${pageContext.request.contextPath}"/>   
    <style>
        .navbar {
            background-color: black !important;
            margin-bottom: 0; 
            border-radius: 0;
            width: 100%; /* Set width to 100% */
        }
        .navbar-brand {
            color: gold !important;
            font-weight: bold;
        }
        .navbar-nav > li > a {
            color: gold !important; 
            font-weight: 500;
            margin-right: 10px;
            padding: 15px 10px; 
        }
        .navbar-nav > li > a:hover,
        .navbar-nav > a:focus {
            background-color: transparent; 
            border-bottom: 2px solid red; 
        }
        .dropdown-menu {
            background-color: yellow !important; 
            margin-right: 0; 
        }
        .navbar-nav > li {
            float: none; 
            display: inline-block;
            margin-right:15px;
        }
    </style>
</head>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="${ctx}/poly/admin/video/index">ADMINISTRATION TOOL</a>
            </div>
        
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${ctx}/poly/admin/video/index">HOME</a></li> 
                    <li><a href="${ctx}/poly/admin/video/index">VIDEOS</a></li>
                    <li><a href="${ctx}/poly/admin/user/index">USERS</a></li>
                    <li><a href="${ctx}/poly/admin/report/index">REPORTS</a></li>
                </ul>
            </div>
        </div>
    </nav>
