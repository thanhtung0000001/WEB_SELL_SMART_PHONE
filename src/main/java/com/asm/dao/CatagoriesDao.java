package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.entity.categories;

public interface CatagoriesDao extends JpaRepository<categories, Integer> {

}
