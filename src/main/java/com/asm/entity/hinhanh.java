package com.asm.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class hinhanh {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String hinh;

	@ManyToOne
	@JoinColumn(name = "productid")
	product pro_image;

	@ManyToOne
	@JoinColumn(name = "mausacid")
	mausac mausac_inamge;
}
