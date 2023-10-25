package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.asm.service.*;

import com.asm.dao.AccountDao;
import com.asm.entity.account;

@Controller
public class LoginController {

	@Autowired
	AccountDao accDao;
	@Autowired
	SessionService session;

	@RequestMapping("/form/login")
	public String viewLogin(@ModelAttribute("account") account acc, Model model) {
		return "form_login/login";
	}

	@PostMapping("/check/form")
	public String checkError(Model model, @Validated @ModelAttribute("account") account acc, BindingResult result) {

		account account = accDao.getAccount(acc.getTendangnhap(), acc.getMatkhaudangnhap());

		if (result.hasErrors()) {

			return "form_login/login";
		} else if (account == null) {
			model.addAttribute("message", "Sai mật khẩu hoặc tài khoản !");

			System.out.println(acc.getTendangnhap());
			return "form_login/login";

		} else if (account != null && account.getVaitro().equals("user")) {

			session.set("account", account);
			
//			System.out.println(account.getHoten());
			return "redirect:/form/index";
		} else {
			return "redirect:/admin/form";
		}
	}

	@GetMapping("/logout")
	public String logout() {
		session.remove("account");
		return "redirect:/form/index";
	}

	 
}
