package com.asm.controller;

 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.asm.dao.OrderDao;
import com.asm.entity.order;

@Controller
public class OrderController {
	@Autowired
	OrderDao orderDao;

	@GetMapping("/form/order/{id}")
	public String viewOrder(Model model,@PathVariable("id") Integer id) {
		List<order> orders = orderDao.getAllByID(id);
		model.addAttribute("order", orders );
		return "form_order/order";
	}
}
