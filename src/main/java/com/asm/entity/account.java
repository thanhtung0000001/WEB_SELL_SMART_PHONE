package com.asm.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotBlank(message = "Bạn phải điền tên đăng nhập !")
	private String tendangnhap;
	@NotBlank(message = "Bạn phải điền tên mật khẩu !")
	private String matkhaudangnhap;
	private String email;
	private String hoten;
	private String hinh;
	@Temporal(TemporalType.DATE)
	private Date ngaytao;
	private Boolean active;
	private String vaitro;

	@OneToMany(mappedBy = "accounts")
	List<order> order;
}
