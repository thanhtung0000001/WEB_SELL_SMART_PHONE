package com.asm.service.Imple;

import java.util.Collection;
import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.ProductDao;
import com.asm.entity.product;
import com.asm.service.CartService;

@Service
public class CartServiceImplement implements CartService {
	static Map<Integer, product> productCart = new HashMap<>();
	@Autowired
	ProductDao proDao;

	@Override
	public product AddCart(Integer id) {
		product pro = productCart.get(id);

		if (pro == null) {
			pro = proDao.findById(id).get();
			if (pro.getKhuyenmai_id() != null) {

				double giamgia = pro.getGiasp() * (pro.getKhuyenmai_id().getPhantram() / 100.0);

				Integer giaSP = (int) (pro.getGiasp() - giamgia);
				pro.setGiasp(giaSP);
 
			} 
			 
			pro.setSoluong(1);
			productCart.put(id, pro);
		} else {
			pro.setSoluong(pro.getSoluong() + 1);
		}
		return pro;
	}

	@Override
	public void DeleteCart(Integer id) {
		productCart.remove(id);
	}

	@Override
	public product UpdateCart(Integer id, String qty) {
		product pro = productCart.get(id);

		if (qty.equals("plus") && pro.getSoluong() <= 100) {
			pro.setSoluong(pro.getSoluong() + 1);
		} else if (qty.equals("dis")) {
			if (pro.getSoluong() == 1) {
				DeleteCart(id);
			}
			pro.setSoluong(pro.getSoluong() - 1);
		}
		return pro;
	}

	@Override
	public Collection<product> getAllProduct() {
		return productCart.values();
	}

	@Override
	public int getCount() {
		// Tong so luong trong gio hang
		return productCart.values().stream().mapToInt(item -> item.getSoluong()).sum();
	}

	@Override
	public int getAmount() {
		// Tong gia tien cua gio hang

		return productCart.values().stream().mapToInt(item -> item.getGiasp() * item.getSoluong()).sum();
	}

}
