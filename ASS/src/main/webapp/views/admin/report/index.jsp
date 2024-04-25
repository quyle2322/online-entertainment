<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/admin/layout/header.jsp"%>
<br>
<body class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#edit">FAVORITES</a></li>
		<li><a data-toggle="tab" href="#list1">FAVORITES USERS</a></li>
		<li><a data-toggle="tab" href="#list2">SHARE FRIENDS</a></li>
	</ul>

	<div class="tab-content">
		<div id="edit" class="tab-pane fade in active">

			<table class="table">
				<thead>
					<tr>
						<th>Video Title</th>
						<th>Favorite Count</th>
						<th>Lastest Date</th>
						<th>Oldest Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="r" items="${reports}">
						<tr>
							<td>${r.group}</td>
							<td>${r.likes}</td>
							<td>${r.newest}</td>
							<td>${r.oldest}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div id="list1" class="tab-pane fade">
			<div class="panel panel-default">
			<label for="" style="padding: 5px;">Video Title</label>
			<form action="${ctx}/poly/admin/report/index" method="post">
				<select name="id" id="filter-dropdown" style="width: 93%; padding: 5px;">
				    <c:forEach var="video" items="${videos}">
				        <option value="${video.id}" ${param.id==video.id?'selected':'' }>${video.title}</option>
				    </c:forEach>
				</select>

			    <input type="submit" value="Submit">
			</form>
				<table class="table">
					<thead>
						<tr>
							<th>Username</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Favorite Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="f" items="${favorites}">
						<c:set var="u" value="${f.user}"/>
							<tr>
								<td>${u.id}</td>
								<td>${u.fullname}</td>
								<td>${u.email}</td>
								<td>${f.likeDate}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
		<div id="list2" class="tab-pane fade">
			<div class="panel panel-default">
				<label for="" style="padding: 5px;">Video Title</label> <select
					id="filter-dropdown" style="width: 70%; padding: 5px;">
					<option value="all">All</option>
					<option value="favorite">Favorites</option>
					<option value="date">Date</option>
				</select>
				<table class="table">
					<thead>
						<tr>
							<th>SenderName</th>
							<th>Sender Email</th>
							<th>Receive Email</th>
							<th>Sent Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
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
</body>
<script>

    window.onload = function() {
        var tab = document.querySelector('a[href="#list1"]');
        tab.click();
    };
</script>
