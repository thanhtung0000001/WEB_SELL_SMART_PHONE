package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.entity.account;

public interface AccountDao extends JpaRepository<account, Integer> {

	@Query("SELECT a FROM account a WHERE a.tendangnhap LIKE ?1 AND a.matkhaudangnhap LIKE ?2")
	account getAccount(String user, String pass);
}
