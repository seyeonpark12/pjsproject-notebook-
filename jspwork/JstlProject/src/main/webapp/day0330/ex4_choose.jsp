<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<form action="ex4_choose.jsp" method="post" style="width: 200px;">
   <h3>이름을 입력해주세요.</h3>
   <input type="text" name="irum" class="form-control">
   
   <h3>여행가고 싶은 나라를 입력해주세요.</h3>
   <input type="text" name="nara" class="form-control">
   
   <br>
   
   <button type="submit" class="btn btn-info">결과확인</button>
   
</form>

<c:if test="${!empty param.irum}">
   <h3>이름:${param.irum}</h3>
   <h3>가고싶은나라:${param.nara }</h3>
   
   <c:choose>
      <c:when test="${param.nara=='캐나다' }">
         <h3>캐나다선택함.</h3>
      </c:when>
      
      <c:when test="${param.nara=='중국' }">
         <h3>중국선택함.</h3>
      </c:when>
      
      <c:when test="${param.nara=='프랑스' }">
         <h3>프랑스선택함.</h3>
      </c:when>
      
      <c:when test="${param.nara=='미국' }">
         <h3>미국선택함.</h3>
      </c:when>
      
      <c:otherwise>
      <h3>${param.nara}로 가는 항공권이 없습니다</h3>
      </c:otherwise>
      
      
   </c:choose>
</c:if>

</body>
</html>