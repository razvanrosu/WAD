<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="/WEB-INF/pages/includes/head.jsp"%>
		<title>Online Shop</title>
	</head>
	<body>
		<%@ include file="/WEB-INF/pages/includes/navbar.jsp"%>
		<div class="container" id="pageContent">
			<jsp:include page="${contentTemplate}" />
		</div>
		<%@ include file="/WEB-INF/pages/includes/footer.jsp"%>
	</body>
</html>