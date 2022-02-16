package com.dang.java.domain;

import java.sql.Date;

public class DiaryVO {

	private String id;
	private int a_Feed;
	private int a_Snack;
	private int b_Diagnosis;
	private int b_Vaccin;
	private int c_Grooming;
	private int c_Clothes;
	private int d_Nutrients;
	private int d_Poo;
	private int e_Trainning;
	private int e_Hotel;
	private int e_Kindergarten;
	private Date date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getA_Feed() {
		return a_Feed;
	}

	public void setA_Feed(int a_Feed) {
		this.a_Feed = a_Feed;
	}

	public int getA_Snack() {
		return a_Snack;
	}

	public void setA_Snack(int a_Snack) {
		this.a_Snack = a_Snack;
	}

	public int getB_Diagnosis() {
		return b_Diagnosis;
	}

	public void setB_Diagnosis(int b_Diagnosis) {
		this.b_Diagnosis = b_Diagnosis;
	}

	public int getB_Vaccin() {
		return b_Vaccin;
	}

	public void setB_Vaccin(int b_Vaccin) {
		this.b_Vaccin = b_Vaccin;
	}

	public int getC_Grooming() {
		return c_Grooming;
	}

	public void setC_Grooming(int c_Grooming) {
		this.c_Grooming = c_Grooming;
	}

	public int getC_Clothes() {
		return c_Clothes;
	}

	public void setC_Clothes(int c_Clothes) {
		this.c_Clothes = c_Clothes;
	}

	public int getD_Nutrients() {
		return d_Nutrients;
	}

	public void setD_Nutrients(int d_Nutrients) {
		this.d_Nutrients = d_Nutrients;
	}

	public int getD_Poo() {
		return d_Poo;
	}

	public void setD_Poo(int d_Poo) {
		this.d_Poo = d_Poo;
	}

	public int getE_Trainning() {
		return e_Trainning;
	}

	public void setE_Trainning(int e_Trainning) {
		this.e_Trainning = e_Trainning;
	}

	public int getE_Hotel() {
		return e_Hotel;
	}

	public void setE_Hotel(int e_Hotel) {
		this.e_Hotel = e_Hotel;
	}

	public int getE_Kindergarten() {
		return e_Kindergarten;
	}

	public void setE_Kindergarten(int e_Kindergarten) {
		this.e_Kindergarten = e_Kindergarten;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
