package com.asm.service;

import java.util.Collection;

import com.asm.entity.product;

public interface CartService {

	Collection<product> getAllProduct();

	product AddCart(Integer id);

	void DeleteCart(Integer id);
	
	product UpdateCart(Integer id , String qty);
	int getCount();
	int getAmount();
}
