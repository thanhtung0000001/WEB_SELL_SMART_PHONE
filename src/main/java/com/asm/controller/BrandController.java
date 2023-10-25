package com.asm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.BrandDao;
import com.asm.dao.ProductDao;

import com.asm.entity.product;

@Controller
public class BrandController {

	@Autowired
	ProductDao proDao;
	@Autowired
	BrandDao braDao;

	@RequestMapping("/form/brand")
	public String viewBrand(Model model, @RequestParam("param") String brand_id) {
		// lấy sản phẩm theo tên nhãn hàng
		List<product> prod = proDao.getProductBrand(brand_id);

		model.addAttribute("list", prod);

		model.addAttribute("brand", brand_id);
		
	 
		
		return "form_brand/product_brand";
	}
}
