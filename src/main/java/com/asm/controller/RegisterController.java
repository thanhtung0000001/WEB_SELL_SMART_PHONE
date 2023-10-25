package com.asm.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.AccountDao;
import com.asm.entity.account;

@Controller
public class RegisterController {

	@Autowired
	AccountDao accDao;

	@RequestMapping("/form/register")
	public String view(@ModelAttribute("register") account acc) {
		return "form_register/register";
	}

	@PostMapping("/register/account")
	public String addAccount(@Validated @ModelAttribute("register") account acc, BindingResult result, Model model,
			@RequestParam("pass") String pasString) {
//		System.out.println(pasString);
//		System.out.println(acc.getMatkhaudangnhap());
		if (result.hasErrors()) {
			return "form_register/register";
		} else if (!acc.getMatkhaudangnhap().equalsIgnoreCase(pasString)) {
			model.addAttribute("message", "Mật khẩu hiện tại không khớp !");
			return "form_register/register";
		} else {
			acc.setActive(true);
			acc.setNgaytao(new Date());
			acc.setVaitro("user");
			accDao.save(acc);

		}
		return "form_register/success";
	}
}
