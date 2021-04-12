<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<style type="text/css">
	.err{
		font-size:9pt;
		color:red;
		font-weight: bold;
	}
</style>    
albumInsertForm.jsp<br>


<h2>앨범 추가 화면</h2>
<form:form commandName="albumBean"  method="post" action="insert.ab">
	<p>
		<label>노래제목</label>
		<input type="text" name="title" value="${ albumBean.title }">
		<form:errors cssClass="err" path="title"></form:errors>
	</p>

	<p>
		<label>가수명</label>
		<input type="text" name="singer" value="${ albumBean.singer }">
		<form:errors cssClass="err" path="singer"></form:errors>
	</p>
	
	<p>
		<label>가격</label>
		<input type="text" name="price" value="${ albumBean.price }">
		<form:errors cssClass="err" path="price"></form:errors>
	</p>
	
	<p>
		<label>발매일</label>
		<input type="text" name="day" value="${ albumBean.day }">
	</p>
	<p>
		<input type="submit"  value="추가하기">
	</p>
</form:form>










