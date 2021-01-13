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
		<div class="progress-bar" style="width: ${currentPosition}%"></div>
	</div>

	<c:forEach var="boards" items="${boards}" varStatus = "stauts">
		<div class="card col-md-12 m-2">
			<div class="card-body">
				<h4 class="card-title">${boards.title}</h4>
				
				<a href="/blog/board?cmd=detail&id=${boards.id }" class="btn btn-primary">상세보기</a>
			</div>
		</div>
	<br />
	</c:forEach>
	
	<ul class="pagination justify-content-center">

	<c:choose>
		<c:when test="${empty param.keyword}">	<!-- null이랑 공백을 체크해줌, null이거나 공백이면 실행 -->
			<c:set var ="pagePrev" value="/blog/board?cmd=list&page=${param.page-1}"></c:set>
			<c:set var ="pageNext" value="/blog/board?cmd=list&page=${param.page+1}" />
		</c:when>
		<c:otherwise>
			<c:set var ="pagePrev" value="/blog/board?cmd=search&page=${param.page-1}&keyword=${param.keyword }" />
			<c:set var ="pageNext" value="/blog/board?cmd=search&page=${param.page+1}&keyword=${param.keyword }" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${param.page == 0 }">
			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		</c:when>
		
		<c:otherwise>
			<li class="page-item"><a class="page-link" href="${pageScope.pagePrev}">Previous</a></li>
			<!-- pageScope: 해당페이지 / requestScope: 요청시마다 새로 만들어짐   
			     applicationScope: 서버 켜지는 순간부터 꺼지는 순간까지
				 SessionScope: 브라우저가 닫힐 때 까지 or 세션을 무효화 시킬 때-->
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${lastPage} == ${param.page }">
			<li class="page-item disabled"><a class="page-link" href="/blog/board?cmd=list&page=${param.page+1}">Next</a></li>
		</c:when>
		
		<c:otherwise>
			<li class="page-item"><a class="page-link" href="${pageScope.pageNext}">Next</a></li>
		</c:otherwise>
	</c:choose>
		
	</ul>

</div>
</body>
</html>

