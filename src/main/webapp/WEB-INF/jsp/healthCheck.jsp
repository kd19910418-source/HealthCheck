<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
        <h2>BMIを計算します</h2>
        <p>あなたの身長、体重を入力し、診断ボタンを押してください。</p>
        <form class="container" action="HealthCheck" method="post">
          身長：<input type="text" name="height" value="${height}" />(cm)
          <span style="color:red;">${heightError}</span>
          <br />
          体重：<input type="text" name="weight" value="${weight}" />(kg)
          <span style="color:red;">${weightError}</span>
          <br />
          <p style="color:red;">${errorMessage}</p>
          <div id="diagnosis_button"><input type="submit" value="診断" /></div>
        </form>
        <p>
          BMI (Body Mass Index) は、[体重(kg)] ÷ [身長(m)2]
          によって算出される、肥満度の国際的な指標です。
        </p>
      </main>
    </div>

    <footer>
      <div><a href="HealthCheck">トップページ</a></div>
    </footer>
  </body>
</html>
