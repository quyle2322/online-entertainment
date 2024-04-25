<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html lang="en">
<head>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <title>Trang chủ</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
        #myCarousel .carousel-inner .item img {
            height:500px;
            width: 100%; 
            object-fit: cover; 
        }
    </style>
</head>
<body>
	<jsp:include page="/views/user/layout/header.jsp"></jsp:include>
	<br>
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
              <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
          
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active">
                <img src="${ctx}/views/images/1.jpg" alt="Los Angeles">
              </div>
          
              <div class="item">
                <img src="${ctx}/views/images/2.webp" alt="1">
              </div>
              <div class="item">
                <img src="${ctx}/views/images/3.png" alt="2">
              </div>
              <div class="item">
                <img src="${ctx}/views/images/4.webp" alt="3">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <h3 class="text-center" style="font-weight:700">
              DANH SÁCH VIDEO
          </h3>
          <c:forEach var="v" items="${videos}">
			<div class="col-md-4">
				<div class="panel panel-default">
				  <div class="panel-body">
					  <a href="${ctx}/poly/user/detail/${v.id}">
					  	<img class="img-responsive" src="${ctx}/views/images/${v.poster}">
					  </a>
				  </div>
				  <div class="panel-footer" style="height:80px">
				  	${v.title}
				  </div>
				  <div class="panel-footer text-right">
				  	<a href="${pageContext.request.contextPath}/poly/user/like/${v.id}" class="btn btn-xs btn-success">Like</a>
				  	<a href="" class="btn btn-xs btn-info">Share</a>
				  </div>
				</div>
			</div>
		</c:forEach>
    </div>
    <br>
    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>
</body>
</html>
