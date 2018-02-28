<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <c:if test="${check > 0}">
      <script type="text/javascript">
       alert("글쓰기 작성완료");
         $(location).attr("href", "${root}/manager/boardUpdate.do?pageNumber=${pageNumber}");
      </script>
   </c:if>
   
   <c:if test="${check == 0}">
      <script type="text/javascript">
      	alert("글쓰기 실패");
         $(location).attr("href", "${root}/manager/boardUpdate.do?pageNumber=${pageNumber}");
      </script>
   </c:if>
</body>
</html>