<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
albumUpdateForm.jsp <br>
<%@include file="./../common/common.jsp"%>
<style type="text/css">
	.err{
		font-size:9pt;
		color:red;
		font-weight: bold;
	}
</style>    


<h2>앨범 수정 화면 (보고 있던 페이지 : ${pageNumber })</h2>
<form:form commandName="album"  method="post" action="update.ab">

	<input type="hidden" name="num" value="${ album.num }">
	<input type="hidden" name="pageNumber" value="${ pageNumber }">
	
	<p>
		<label>노래제목</label>
		<input type="text" name="title" value="${ album.title }">
		<form:errors cssClass="err" path="title"></form:errors>
	</p>

	<p>
		<label>가수명</label>
		<input type="text" name="singer" value="${ album.singer }">
		<form:errors cssClass="err" path="singer"></form:errors>
	</p>
	
	<p>
		<label>가격</label>
		<input type="text" name="price" value="${ album.price }">
		<form:errors cssClass="err" path="price"></form:errors>
	</p>
	
	<p>
		<label>발매일</label>
		<fmt:parseDate var="day" value="${album.day}" pattern="yyyy-MM-dd"/>
		<fmt:formatDate var="formatday" value="${day}" pattern="yyyy-MM-dd"/>
		<input type="text" name="day" value="${ formatday }">
	</p>
	<p>
		<input type="submit"  value="수정하기">
	</p>
</form:form>


