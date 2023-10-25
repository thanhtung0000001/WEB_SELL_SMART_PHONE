package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.entity.order;

public interface OrderDao extends JpaRepository<order,Integer> {
@Query("SELECT o FROM order o WHERE o.accounts.id = ?1")
List<order> getAllByID(Integer id);
}
