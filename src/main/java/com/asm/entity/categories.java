package com.asm.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class categories {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private	Integer id;
	private String tendanhmuc;
	
	@OneToMany(mappedBy = "catagory")
	List<product> product;
	
	 
}
