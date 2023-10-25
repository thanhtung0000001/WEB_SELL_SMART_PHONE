package com.asm.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.asm.dao.DiscountDao;
import com.asm.dao.ProductDao;
import com.asm.entity.makhuyenmai;
import com.asm.entity.product;

@Controller
public class DisccountController {
	@Autowired
	DiscountDao dissDao;
	@Autowired
	ProductDao proDao;

	@GetMapping("/form/disscount")
	public String formDiss(@ModelAttribute("disscount") makhuyenmai diss, Model model) {

		model.addAttribute("diss", dissDao.findAll());
		return "form_admin/form_discount";
	}

	@PostMapping("/form/disscount/save")
	public String save(@ModelAttribute("disscount") makhuyenmai diss, Model model) {
		diss.setNgaytao(new Date());
		dissDao.save(diss);
		return "redirect:/form/disscount";
	}

	@GetMapping("/form/disscount/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dissDao.deleteById(id);
		return "redirect:/form/disscount";
	}


	@GetMapping("/form/disscount/edit/{id}")
	public String edit(@PathVariable("id") Integer id,Model model) {
		 
		model.addAttribute("disscount",dissDao.findById(id));
		model.addAttribute("diss", dissDao.findAll());
		return "form_admin/form_discount";
	}
	@ModelAttribute("disscount_product")
	public List<product> getAllProduct() {
		return proDao.findAll();
	}
}
