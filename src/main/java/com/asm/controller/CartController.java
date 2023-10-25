package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.service.CartService;

@Controller
public class CartController {
	@Autowired
	CartService cartService;

	@RequestMapping("/cart/view")
	public String viewCart(Model model) {

		model.addAttribute("list", cartService.getAllProduct());
		model.addAttribute("cartAmount", cartService.getAmount());
		model.addAttribute("cartCount", cartService.getCount());
		return "cart/viewcart";
	}

	@GetMapping("/cart/add/{id}")
	public String add(Model model, @PathVariable("id") Integer id) {
		cartService.AddCart(id);

		return "redirect:/cart/view";
	}

	@GetMapping("/cart/update/{id}/plus")
	public String plusCart(@PathVariable("id") Integer id, @RequestParam("param") String qty) {
		cartService.UpdateCart(id, qty);
		return "redirect:/cart/view";
	}

	@GetMapping("/cart/update/{id}/discount")
	public String DisCart(@PathVariable("id") Integer id, @RequestParam("param") String qty) {
		cartService.UpdateCart(id, qty);
		return "redirect:/cart/view";

	}
}
