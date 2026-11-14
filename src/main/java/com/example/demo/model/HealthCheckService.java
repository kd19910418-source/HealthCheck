package com.example.demo.model;

import org.springframework.stereotype.Service;

@Service
public class HealthCheckService {
	public void execute(Health health) {
		double weight = health.getWeight();
		double height = health.getHeight();
		double bmi = weight / ((height / 100) * (height / 100));
		health.setBmi(bmi);

		String bodyType;
		if (bmi < 18.5) {
			bodyType = "痩せ型";
		} else if (bmi < 25) {
			bodyType = "普通体型";
		} else {
			bodyType = "肥満体型";
		}
		health.setBodyType(bodyType);

	}
}