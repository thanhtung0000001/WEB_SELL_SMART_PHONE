package com.asm.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.entity.product;

 
public interface ProductDao extends JpaRepository<product, Integer> {
	// Tim kiem theo id cua product
	@Query("Select p FROM product p WHERE p.id =?1")
	product getProduct(Integer id);

	// Tim kiem theo ma danh muc
	@Query("SELECT p FROM product p WHERE p.catagory.id =?1 and p.active = true")
	List<product> getProductByID(Optional<Integer> id);

	// Tim kiem theo ten product
	@Query("SELECT p FROM product p WHERE p.tensp LIKE %?1%")
	List<product> getProductByKeyword(Optional<String> keyword);

	// tìm kiếm theo nhãn hàng của sản phẩm
	@Query("SELECT p FROM product p WHERE p.brand.tennhanhang = ?1 and p.active = true")
	List<product> getProductBrand(String brand_id);

	//
	@Query("SELECT p FROM product p WHERE p.active = true")
	List<product> findALLProduct();

	@Query("SELECT p FROM product p WHERE p.active = false")
	List<product> findRecyleProduct();
}
