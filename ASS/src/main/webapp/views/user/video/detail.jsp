<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
        }
        
        .video-wrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>

     <%@include file="/views/user/layout/header.jsp" %>
     <br>
      <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-body video-wrapper">
                        <iframe src="https://www.youtube.com/embed/${video.id}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin"
                            allowfullscreen></iframe>
                    </div>
                    <div class="panel-heading" style="font-weight:700">${video.title}</div>
                    <div class="panel-footer text-right">
                        <a href="${pageContext.request.contextPath}/poly/user/like/${video.id}" class="btn btn-xs btn-success">Like</a>
				  		<a href="${pageContext.request.contextPath}/poly/user/share" class="btn btn-xs btn-info">Share</a>
                    </div>
                </div>
            </div>
            <c:set var="count" value="0" />
            <c:forEach var="v" items="${videos}">
            	<c:if test="${count < 4}">
		            <div class="col-md-5">
		                <div class="panel panel-default">
		                    <div class="panel-body">
		                        <div class="row">
		                         <div class="col-md-4">
		                            <a href="${pageContext.request.contextPath}/poly/user/detail/${v.id}">
								  		<img class="img-responsive" src="${pageContext.request.contextPath}/views/images/${v.poster}">
								  	</a>
								  	</div>
		                            <div class="col-md-8">${v.title}</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		          </c:if>
		          <c:set var="count" value="${count + 1}" />
			</c:forEach>
        </div>
    </div>
    <br>
    <jsp:include page="/views/user/layout/footer.jsp"></jsp:include>