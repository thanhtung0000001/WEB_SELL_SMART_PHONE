
package com.asm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.asm.dao.OrderdetailDao;
import com.asm.entity.orderdetail;

@Controller
public class OrderDetailController {
	@Autowired
	OrderdetailDao orderDetailDao;
	Integer tong = 0;

	@GetMapping("/form/OrderDetail/{id}")
	public String viewDetail(Model model, @PathVariable("id") Integer id) {
		List<orderdetail> orderDetail = orderDetailDao.getAllOrderDetailByID(id);

		tong = orderDetail.stream().mapToInt(item -> item.getPrice() * item.getQuantity()).sum();

		model.addAttribute("Tong", tong);
		model.addAttribute("orderDetail", orderDetail);
		return "form_orderdetail/orderdetail";
	}
}
