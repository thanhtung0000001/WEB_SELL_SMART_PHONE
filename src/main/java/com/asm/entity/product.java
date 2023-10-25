package com.asm.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String tensp;
	private String hinhsp;
	private Integer giasp;

	private Integer soluong;

	private String mota;
	@Temporal(TemporalType.DATE)
	private Date ngaytao;
	private Boolean active;

	@ManyToOne
	@JoinColumn(name = "danhmucid")
	categories catagory;

	@ManyToOne
	@JoinColumn(name = "nhanhangid")
	nhanhang brand;

	@ManyToOne
	@JoinColumn(name = "makhuyenmaiid")
	makhuyenmai khuyenmai_id;

	@OneToMany(mappedBy = "pro_image")
	List<hinhanh> product_image;

	@OneToMany(mappedBy = "product")
	List<orderdetail> orderdetail;
	
}
