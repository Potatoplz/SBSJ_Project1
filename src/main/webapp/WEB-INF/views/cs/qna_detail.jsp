<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/headerMain.jsp"></jsp:include>

<html>
	<head>
		<meta charset="UTF-8">
		<title> 1:1문의 상세보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		<style type="text/css">
		
		th {
		text-align:center;
		}
		</style>	
	</head>
<body>
<!-- body 시작 -->
	<div class="container col-sm-7">
		<hr>
		<h3 class="text-center">1:1 맞춤상담</h3>
		<hr>
		<table class="table table-hover">
					<input type="hidden" id="member_id" name="member_id" value="${detail_dto.member_id}">	
			<tbody>
			
				<tr>
					<th> 번호 </th>	<td>${detail_dto.qa_question_id}</td>
					<th> 제목 </th>	<td>${detail_dto.qa_question_title}</td>
				</tr>
				<tr>
					<th> 작성자 </th>	<td>${detail_dto.member_nick}</td>
					<th> 작성일 </th>	<td>${detail_dto.qa_question_date}</td>
				</tr>
				<tr>
					<th> 내용 </th>		<td colspan="3">${detail_dto.qa_question_content}</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<!-- 목록으로 가기 버튼 : 누구나 보임 -->
		<div>
			<a href="${pageContext.request.contextPath}/qna/list">
				<button type="button" class="btn btn-info float-left" id="list"> 목록으로 가기 </button> 
			</a>
			
		<!-- 수정&삭제 버튼 : 내 게시글에서만 보임 -->
		<c:if test="${login_info.member_id == detail_dto.member_id || login_info.admin_yn eq 'Y'}"> 
			<div class="float-right">
				<a href="${pageContext.request.contextPath}/qna/uform?qa_question_id=${detail_dto.qa_question_id}">
					<button type="button" class="btn btn-warning" id="update"> 수정 </button> 
				</a>
				<button type="button" class="btn btn-danger" id="delete_btn"> 삭제 </button>
			</div>
		</c:if>
		
		</div>
	</div>	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {
			if(confirm("삭제 하시겠습니까?")) {
				$.get(
						"${pageContext.request.contextPath}/qna/delete"
						, {
							qa_question_id : ${detail_dto.qa_question_id}
						}
						, function(data, status) {
							if( data >= 1 ){
								alert("게시글이 삭제 되었습니다.");
								location.href="${pageContext.request.contextPath}/qna/list";
							} else if( data <= 0 ) {
								alert("게시글 삭제를 실패 하였습니다.");
							} else {
								alert("잠시 후 다시 시도해 주세요.");
							}
						}//call back
				);//get
			}//if
		});//click
	}); //ready
	</script>
	<br><br><br><br><br><br>
</body>
<%@ include file="/WEB-INF/views/footerMain.jsp" %>
</html>