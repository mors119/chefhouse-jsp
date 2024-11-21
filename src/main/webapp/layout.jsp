<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/template/meta.jsp" />
	<title>CHEFHOUSE</title>
	<jsp:include page="/template/links.jsp" />
	<jsp:include page="/template/script.jsp" />
</head>
<body>
	<header id="header">
		<jsp:include page="/jsp/header.jsp" />
	</header>
	
		<div id="skip_navi">
			<a href="#container">본문바로가기</a>
		</div>

			<jsp:include page="/jsp${layout }.jsp" />
<%-- 			<jsp:include page="/jsp/login.jsp"/> --%>
		
	<footer id="footer">
		    	<!-- 탑버튼 공통 -->
		<div class="float_btn">
			<a href="#header" class="go_top_btn">TOP</a>
		</div>
		<jsp:include page="/jsp/footer.jsp" />
	</footer>
</body>
</html>