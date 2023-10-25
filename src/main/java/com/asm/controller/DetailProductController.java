package com.asm.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.ProductDao;
import com.asm.entity.product;

@Controller
public class DetailProductController {
	@Autowired
	ProductDao proDao;

	 

	@GetMapping("/form/detail/{id}")
	public String viewDetail(Model model, @PathVariable("id") Integer id,
			@RequestParam("param") Optional<Integer> proID) {
		product p = proDao.getProduct(id);

		List<product> pro = proDao.getProductByID(proID);

		model.addAttribute("list_related", pro);
		model.addAttribute("list", p);
		return "form/detail";
	}
}
