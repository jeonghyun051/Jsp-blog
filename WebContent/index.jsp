<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <%
   
   	//response.sendRedirect("board/list.jsp");
   //response.sendRedirect("board?cmd=list");
   RequestDispatcher dis = request.getRequestDispatcher("board?cmd=list&page=0");
   dis.forward(request, response);
   //톰켓이 생성하는 request와 response를 재사용한다. 
   //다시 접근하는게 아니라 내부적으로 움직인다는 뜻.
   //그래서 모든파일에 sendRedirect는 바꿔줘야한다.
   
   %>