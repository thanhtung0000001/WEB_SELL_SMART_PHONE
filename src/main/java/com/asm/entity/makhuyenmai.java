package com.asm.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

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
public class makhuyenmai {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngaybatdau;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngayketthuc;
	private Date ngaytao;
	private Integer phantram;
	
	@OneToMany(mappedBy = "khuyenmai_id")
	List<product> prokhuyenmai;
}
