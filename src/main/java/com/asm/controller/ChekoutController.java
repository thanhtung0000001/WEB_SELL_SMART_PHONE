package com.asm.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asm.dao.OrderDao;
import com.asm.dao.OrderdetailDao;
import com.asm.dao.ProductDao;
import com.asm.entity.order;
import com.asm.entity.orderdetail;
import com.asm.entity.product;
import com.asm.service.CartService;

@Controller
public class ChekoutController {

	@Autowired
	CartService cartService;
	@Autowired
	OrderDao orderDao;
	@Autowired
	OrderdetailDao ordertailDao;
	@Autowired
	ProductDao prodDao;
 
	 
	@RequestMapping("/form/checkout")
	public String view(@ModelAttribute("order") order order, Model model) {
		model.addAttribute("list", cartService.getAllProduct());
		model.addAttribute("cartAmount", cartService.getAmount());
		model.addAttribute("cartCount", cartService.getCount());
		return "cart/checkout";
	}

	@PostMapping("/checkout/save")
	public String save(@ModelAttribute("order") order order, Model model) {
			
			order.setNgaytao(new Date());
			order.setTrangthai(1);
			orderDao.save(order);
		 
		for (product item : cartService.getAllProduct()) {

			orderdetail orderdetail = new orderdetail();

			@SuppressWarnings("deprecation")
			product prodetail = prodDao.getById(item.getId());
			
			@SuppressWarnings("deprecation")
			order orders = orderDao.getById(order.getId());

			orderdetail.setPrice(item.getGiasp());
			orderdetail.setQuantity(item.getSoluong());
			orderdetail.setProduct(prodetail);
			orderdetail.setOrder(orders);

			ordertailDao.save(orderdetail);
		}

		return "redirect:/form/index";
	}
}
