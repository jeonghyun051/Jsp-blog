<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%@ include file="../layout/header.jsp" %>

<%
	String result = (String)request.getAttribute("result");
%>

<div class="container">

	<div class="m-2">
		<form class="form-inline d-flex justify-content-end" action="/blog/board">
			<input type="hidden" name="cmd" value="search" />
			<input type="hidden" name="page" value="0" />
			
			<input type="text" name="keyword" class="form-control mr-sm-2" placeholder="Search">			
			<button class="btn btn-primary m-1">검색</button>
		
		</form>
	</div>

	<div class="progress col-md-12 m-2">
		<div class="progress-bar" style="width: 70%"></div>
	</div>

	<c:forEach var="BoardList1" items="${BoardList}" varStatus = "stauts">
		<div class="card col-md-12 m-2">
			<div class="card-body">
				<h4 class="card-title">${BoardList1.title}</h4>
				
				<a href="/blog/board?cmd=detail&id=${BoardList1.id }" class="btn btn-primary">상세보기</a>
			</div>
		</div>
	<br />
	</c:forEach>
	
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="/blog/board?cmd=list&page=${param.page-1}">Previous</a></li>
		<li class="page-item"><a class="page-link" href="/blog/board?cmd=list&page=${param.page+1}">Next</a></li>
	</ul>
</div>

</body>
</html>

