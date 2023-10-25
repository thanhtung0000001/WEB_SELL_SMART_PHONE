package com.asm.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.ProductDao;
import com.asm.entity.product;

@Controller
public class RecycleController {
	@Autowired
	ProductDao proDao;

	@RequestMapping("/form/recycle")
	public String view(Model model) {

		model.addAttribute("recycle", proDao.findRecyleProduct());
		return "form_admin/form_recyclebin";
	}

	@GetMapping("/restore/{id}")
	public String restore(Model model, @PathVariable("id") Integer id) {
		product prod = proDao.findById(id).get();
		prod.setActive(true);
		proDao.save(prod);
		return "redirect:/form/recycle";
	}

	@GetMapping("/delete/bin/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {
		proDao.deleteById(id);
		return "redirect:/form/recycle";
	}

	@PostMapping("/recycle/search")
	public String search(@RequestParam("keyword") Optional<String> keyword, Model model) {
		if (keyword.isEmpty()) {
			return "redirect:/form/recycle";
		}
		model.addAttribute("recycle", proDao.getProductByKeyword(keyword));
		return "form_admin/form_recyclebin";

	}

}
