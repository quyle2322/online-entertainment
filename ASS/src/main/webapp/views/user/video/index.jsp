<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="container">
        <div class="row">
        <c:forEach var="video" items="${videos}">
            <div class="col-md-4">
                <div class="panel panel-default">
	                    <div class="panel-body">
	                        <a href="${pageContext.request.contextPath}/poly/servlet/chitietvideo">
	                        	<img src="${pageContext.request.contextPath}/views/images/${video.poster}" style="width:100%">
	                        </a>
	                        
	                    </div>
	                    <div class="panel-heading">${video.title}</div>
	                    <div class="panel-footer text-right">
	                        <div class="btn btn-sm btn-warning">Like</div>
	                        <div class="btn btn-sm btn-info">Share</div>
	                    </div> 
                	</div>
            	</div>
          </c:forEach>
        </div>

    </div>