package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.entity.orderdetail;

public interface OrderdetailDao extends JpaRepository<orderdetail, Integer>{
@Query("SELECT d FROM orderdetail d WHERE d.order.id = ?1 ")
List<orderdetail> getAllOrderDetailByID(Integer id);
}
