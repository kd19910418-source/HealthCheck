<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css"
    />
    <title>健康診断アプリ</title>
  </head>
  <body>

    <header>
      <h1>健康診断アプリ</h1>
    </header>

    <div id="main_container">
      <main>
        <h2>健康診断の結果</h2>
        <div class="container">
            <p>身長：<c:out value="${health.height}" /><br /></p>
            <p>体重：<c:out value="${health.weight}" /><br /></p>
            <p>BMI：<fmt:formatNumber value="${health.bmi}" pattern="#0.00" /><br /></p>
            <p>体格：<c:out value="${health.bodyType}" /></p>
        </div>
      </main>
    </div>

    <footer>
      <div><a href="HealthCheck">トップページ</a></div>
    </footer>
  </body>
</html>
