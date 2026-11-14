package com.example.demo.controller;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Health;
import com.example.demo.model.HealthCheckService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HealthCheckController {
	private final HealthCheckService healthCheckService;

	@GetMapping("/HealthCheck")
	public String showHealthCheck() {
		// フォワード
		return "healthCheck";
	}

	@PostMapping("/HealthCheck")
	public String executeHealthCheck(
			@RequestParam(required = false) String weight,
			@RequestParam(required = false) String height,
			HttpServletRequest request) {

		// 入力値を画面に保持する
		request.setAttribute("weight", weight);
		request.setAttribute("height", height);

		// 入力チェック
		if (weight == null || weight.isBlank()) {
			request.setAttribute("weightError", "体重を入力してください");
		}

		if (height == null || height.isBlank()) {
			request.setAttribute("heightError", "身長を入力してください");
		}

		// 空欄があれば入力画面に戻る
		if (weight == null || weight.isBlank()
				|| height == null || height.isBlank()) {
			return "healthCheck";
		}

		double weightValue;
		double heightValue;

		// 数値に変換
		try {
			weightValue = Double.parseDouble(weight);
			heightValue = Double.parseDouble(height);

		} catch (NumberFormatException e) {
			request.setAttribute("errorMessage", "数値を入力してください");
			return "healthCheck";
		}

		// 異常値チェック
		if (!Double.isFinite(weightValue) || !Double.isFinite(heightValue)
				|| weightValue < 10 || weightValue > 300
				|| heightValue < 50 || heightValue > 250) {

			request.setAttribute("errorMessage",
					"身長は50～250cm、体重は10～300kgで入力してください");

			return "healthCheck";
		}

		// 入力値をプロパティに設定
		Health health = new Health();
		health.setHeight(heightValue);
		health.setWeight(weightValue);

		// 健康診断を実行
		this.healthCheckService.execute(health);

		request.setAttribute("health", health);

		return "healthCheckResult";
	}
}