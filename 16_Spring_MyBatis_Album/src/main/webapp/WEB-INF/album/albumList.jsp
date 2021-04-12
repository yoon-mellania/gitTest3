<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp"%>
<script type="text/javascript">
	function insert(){
		location.href = "insert.ab"; // form 요청
	}
	function goUpdate(num,pageNumber){
		alert(num + "," + pageNumber);
		location.href = "update.ab?num="+num+"&pageNumber="+pageNumber;
	}
</script>
album\ albumList.jsp <br>

<h2  align="center">상품 리스트 화면(레코드갯수:${totalCount })</h2>
<center>
<!-- 
whatColumn=title,singer
keyword=다이 ,bts
-->
<form action="list.ab" method="get">
	<select name="whatColumn">
		<option value="all">전체검색</option>
		<option value="title">노래제목</option>
		<option value="singer">가수명</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
</center>
<table border="1" align="center">
	<tr>
		<td colspan="7" align="right">
			<input type="button" value="추가하기" onClick="insert()">
		</td>
	</tr>
	<tr>
		<th>번호</th>
		<th>노래제목</th>
		<th>가수명</th>
		<th>가격</th>
		<th>출간일</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	<c:forEach var="album" items="${albumLists }">
		<tr>
			<td>${album.num }</td>
			<td><c:out value="${album.title }"> </c:out></td>
			<td>${album.singer }</td>
			<td> <fmt:formatNumber value="${album.price}" pattern="#,###"/>원 </td>    
			<td>
				<fmt:parseDate var="day" value="${album.day}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${day}" pattern="yyyy-MM-dd"/>
			</td>
			<td><a href="delete.ab?num=${album.num }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
			<td><input type="button" value="수정" onClick="goUpdate('${album.num }', '${pageInfo.pageNumber }')"></td>
		</tr>
	</c:forEach>
</table>
<center>
	${pageInfo.pagingHtml } <!-- getPagingHtml() -->
</center>





