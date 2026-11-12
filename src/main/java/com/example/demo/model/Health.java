package com.example.demo.model;

import java.io.Serializable;

import lombok.Data;

@Data
public class Health implements Serializable {
	private double height, weight, bmi;
	private String bodyType;
}