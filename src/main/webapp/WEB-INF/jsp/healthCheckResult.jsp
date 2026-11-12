<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>スッキリ健康診断</title>
</head>
<body>
<h1>スッキリ健康診断の結果</h1>
<p>
身長：<c:out value="${health.height}" /><br>
体重：<c:out value="${health.weight}" /><br>
BMI：<c:out value="${health.bmi}" /><br>
体格：<c:out value="${health.bodyType}" />
</p>
<a href="HealthCheck">戻る</a>
</body>
</html>