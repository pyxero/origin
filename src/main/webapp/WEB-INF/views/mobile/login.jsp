<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>mobile</title>
<%@ include file="../common/mobile/lib.jsp"%>
<script type="text/javascript">
	var code = ${code};
</script>
</head>
<body>${code} ${userId} ${deviceId}
</body>
</html>
