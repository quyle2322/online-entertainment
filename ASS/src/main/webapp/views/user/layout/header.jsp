<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<head>
    <title>Trang chủ</title>
    <style>
        .navbar {
            background-color: yellow !important;
            margin-bottom: 0; 
            border-radius: 0;
        }
        .navbar-brand {
            color: red;
            font-weight: bold;
        }
        .navbar-nav > li > a {
            font-weight: 500;
            margin-right: 15px; 
        }
        .navbar-nav > li > a:hover,
        .navbar-nav > a:focus {
            background-color: transparent; 
            border-bottom: 2px solid red; 
        }
        .dropdown-menu {
            margin-right: 12px;
        }
        /* .navbar-nav > li:hover .dropdown-menu {
            display: block;
        } */
    </style>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="${ctx}/poly/user/index">ONLINE ENTERTAINMENT</a>
            </div>
        
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${ctx}/poly/user/favorite">MY FAVORITES</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MY ACCOUNT <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        <c:if test="${empty sessionScope.user}">
                            <li><a href="${ctx}/poly/user/login">Login</a></li>
                            <li><a href="${ctx}/poly/user/register">Registration</a></li>
                             </c:if>
	                           <c:if test="${!empty sessionScope.user}">
		                            <li><a href="${ctx}/poly/user/forgot-password">Forgot Password</a></li>
		                            <li><a href="${ctx}/poly/user/change-password">Change Password</a></li>
		                             
		                            <li><a href="${ctx}/poly/user/update-account">Edit Profile</a></li>
		                            <li><a href="${ctx}/poly/user/sign-out">Logout</a></li>
	                            </c:if>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>