<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상부상酒</title>

<!--CSS 파일-->
<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/mypage/css/navMypage.css">

<!--CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$.post(
			"${pageContext.request.contextPath}/member/qnaAnswerCnt"
			, function(data, status) {
				if(data == 0){
					$("#qnaAnswerCnt").text(0);
					
				} else {
					$("#qnaAnswerCnt").text(data);
				} 
			}//call back function
	);//post
});//ready 

$(document).ready(function() {
	$.post(
			"${pageContext.request.contextPath}/member/orderStatusCnt"
			, function(data, status) {
				if(data == 0){
					$("#orderStatusCnt").text(0);
					
				} else {
					$("#orderStatusCnt").text(data);
				}
			}//call back function
	);//post
});//ready 

$(document).ready(function() {
	$.post(
			"${pageContext.request.contextPath}/member/unusedCouponCnt"
			, function(data, status) {
				if(data == 0){
					$("#unusedCouponCnt").text(0);
					
				} else {
					$("#unusedCouponCnt").text(data);
				} 
			}//call back function
	);//post
});//ready 

$(document).ready(function() {
	$.post(
			"${pageContext.request.contextPath}/member/orderCnt"
			, function(data, status) {
				if(data == 0){
					$("#orderCnt").text(0);
					
				} else {
					$("#orderCnt").text(data);
				} 
			}//call back function
	);//post
});//ready 

</script>
</head>

<nav>
	<dl class= "nav_total">
				
					<dd class="nav_menu">
						<strong class="nav_menu_name">1:1 문의 답변대기</strong>
						<div class="nav_menu_data">
							<a href="${pageContext.request.contextPath}/qna/list" data-clicklog-type="/click_side_menu_1911" data-log-type="click" data-log-id="1911" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;ticket_unused&quot;, &quot;currentPage&quot;: &quot;&quot; }">
								<span class="i18n-wrapper">
									<span class="data_big" id="qnaAnswerCnt"></span>
									<span class="data_small">개</span>
								</span>
							</a>
						</div>
					</dd>
					<dd class="nav_menu">
						<strong class="nav_menu_name">배송중</strong>
						<div class="nav_menu_data">
							<a href="${pageContext.request.contextPath}/history/my_order_list" data-clicklog-type="/click_side_menu_1912" data-log-type="click" data-log-id="1912" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;myorders_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
								<span class="i18n-wrapper">
									<span class="data_big" id="orderStatusCnt"></span>
									<span class="data_small">개</span>
								</span>
							</a>
						</div>
					</dd>
					
					<!-- 쿠폰 정보 -->						
					<dd class="nav_menu">
						<strong class="nav_menu_name">할인쿠폰</strong>
						<div class="nav_menu_data">
							<a href="${pageContext.request.contextPath}/member/member_coupon_list" data-clicklog-type="/click_side_menu_1913" data-log-type="click" data-log-id="1913" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;coupons_count&quot;, &quot;currentPage&quot;: &quot;&quot;}">
								<span class="i18n-wrapper">
									<span id="unusedCouponCnt" class="data_big"></span>
									<span class="data_small">장</span>
								</span>
							</a>
						</div>
					</dd>
						
					<dd class="nav_menu4">
					<div class="nav_menu2">
						<span class="nav_menu2_name">주문내역</span>
						<a href="${pageContext.request.contextPath}/history/my_order_list" data-clicklog-type="/click_side_menu_2206" data-log-type="click" data-log-id="2206" data-log-version="1" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;rocketmoney_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
							<span class="i18n-wrapper">
								<span class="data_big" id="orderCnt"></span>
								<span class="data_small">건</span>
							</span>
						</a>
					</div>
					<div class="nav_menu2">
					<span class="nav_menu2_name"></span>
					<a href="${pageContext.request.contextPath}/member/member_before_detail" data-clicklog-type="/click_side_menu_1914" data-log-type="click" data-log-id="1914" data-log-version="3" data-has-log-group="menu" data-log-payload="{&quot;pageName&quot; : &quot;my_navigation&quot;, &quot;eventName&quot;: &quot;cash_count&quot;, &quot;currentPage&quot;: &quot;&quot;}" class="nav_menu2_data">
						<span class="i18n-wrapper">
							<span class="data_big" id="coupangCashBalance"></span>
							<span class="data_small">개인정보 수정</span>
						</span>
					</a>
					</div>
					</dd>
				</dl>

	</nav>

