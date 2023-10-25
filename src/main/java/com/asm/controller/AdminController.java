package com.asm.controller;

import java.io.File;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.asm.dao.BrandDao;
import com.asm.dao.CatagoriesDao;
import com.asm.dao.DiscountDao;
import com.asm.dao.ProductDao;
import com.asm.entity.categories;
import com.asm.entity.makhuyenmai;
import com.asm.entity.nhanhang;
import com.asm.entity.product;

import jakarta.servlet.ServletContext;

@Controller
public class AdminController {
	@Autowired
	CatagoriesDao cateDao;
	@Autowired
	ProductDao proDao;
	@Autowired
	BrandDao bradDao;
	@Autowired
	DiscountDao dissDao;
	@Autowired
	ServletContext app;

	@GetMapping("/admin/form")
	public String viewAdmin(@ModelAttribute("product") product pro, Model model) {
		model.addAttribute("list", proDao.findALLProduct());
		return "form_admin/form_admin";
		 
	}

	@PostMapping("/admin/save")
	public String save(@ModelAttribute("product") product pro, @RequestParam("photo_hinh") MultipartFile file,
			Model model) {

		if (pro.getKhuyenmai_id().getId() == null) {
			pro.setKhuyenmai_id(null);
		}

		try {

			String photo_name = file.getOriginalFilename();

			File f = new File(app.getRealPath("/images/") + photo_name);
			
			if (!f.exists()) {
				f.mkdirs();
			}
			
			file.transferTo(f);

			pro.setHinhsp(photo_name);

		} catch (Exception e) {
			e.printStackTrace();
		}
		pro.setNgaytao(new Date());
		pro.setActive(true);

		proDao.save(pro);
		return "redirect:/admin/form";
	}

	@ModelAttribute("list_khuyenmai")
	public List<makhuyenmai> getKm() {
		return dissDao.findAll();
	}

	@GetMapping("/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		product prod = proDao.findById(id).get();

		model.addAttribute("product", prod);
		model.addAttribute("list", proDao.findALLProduct());

		return "form_admin/form_admin";
	}

	@GetMapping("/delete/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {
		product prod = proDao.findById(id).get();
		prod.setActive(false);
		proDao.save(prod);
		return "redirect:/admin/form";
	}


	@ModelAttribute("list_catagory")
	public List<categories> getAllCategory() {
		return cateDao.findAll();
	}

	@ModelAttribute("list_brand")
	public List<nhanhang> getAllBrand() {
		return bradDao.findAll();
	}

}
