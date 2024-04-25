<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <header class="row">
			<%@include file="/views/user/layout/header.jsp" %>
		</header>
		<br>
 	<div class="container">
        <div class="row">
            <c:forEach var="f" items="${favorites}">
				<c:set var="v" value="${f.video}"/>
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
					  	<a href="${ctx}/poly/user/unlike/${f.id}" class="btn btn-xs btn-success">Unlike</a>
					  	<a href="" class="btn btn-xs btn-info">Share</a>
					  </div>
					</div>
				</div>
			</c:forEach>
        </div>
    </div>
    <br>
    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>