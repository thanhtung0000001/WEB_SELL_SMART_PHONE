package com.asm.dao;

import java.util.List;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
 
import com.asm.entity.nhanhang;

 
public interface BrandDao extends JpaRepository<nhanhang, Integer> {
	@Query("SELECT  n.tennhanhang  FROM nhanhang n INNER JOIN n.brand_sanpham p WHERE p.catagory.id = ?1 GROUP BY n.tennhanhang")
	List<String> getBrand(Optional<Integer> id);

	@Query("SELECT n.tennhanhang FROM nhanhang n")
	List<String> getALLNameBrand();
}
