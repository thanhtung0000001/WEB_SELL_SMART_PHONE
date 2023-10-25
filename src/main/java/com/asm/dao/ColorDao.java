package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.entity.mausac;
@Repository
public interface ColorDao extends JpaRepository<mausac, Integer> {

}
