package com.asm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
@RequestMapping("/form/Profile")
public String view(Model model) {
	return "form_user/Profile";
}
}
