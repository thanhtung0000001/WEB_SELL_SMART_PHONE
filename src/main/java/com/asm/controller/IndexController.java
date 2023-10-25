package com.asm.controller;

 
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.BrandDao;
import com.asm.dao.CatagoriesDao;
import com.asm.dao.DiscountDao;
import com.asm.dao.ProductDao;
import com.asm.entity.categories;
 
import com.asm.entity.product;

@Controller
public class IndexController {
	@Autowired
	ProductDao proDao;
	@Autowired
	CatagoriesDao cateDao;
	@Autowired
	BrandDao braDao;
	@Autowired
	DiscountDao dissDao;

	@RequestMapping("/form/index")
	public String viewIndex(Model model, @RequestParam("param") Optional<Integer> id) {
		 
		// neu id ko co thi hien toan bo san pham
		if (id.isEmpty()) {

			// hiển thị tất cả sản phẩm
			List<product> prod = proDao.findALLProduct();
			  
 		
			model.addAttribute("list", prod);
			// hiển thị tất cả các nhãn hàng
			List<String> brand = braDao.getALLNameBrand();
			model.addAttribute("List_Brand", brand);

		}

		// nguoc lai thi hien thi danh muc cua id theo san pham
		else {
			// hiển thị theo danh mục
			List<product> prod = proDao.getProductByID(id);
			model.addAttribute("list", prod);
			// hiển thị nhãn hàng theo danh mục của sản phẩm
			List<String> brand = braDao.getBrand(id);
			model.addAttribute("List_Brand", brand);
		}

		return "form/index";
	}

	// hiển thị tất cả danh mục
	@ModelAttribute("List_DanhMuc")
	public List<categories> getAll() {
		return cateDao.findAll();
	}

//	@ModelAttribute("List_Brand")
//	public List<product> getAllBrand( @RequestParam("param") Optional<Integer> id){
//		return proDao.getNhanHang(id);
//	}
//	

	@RequestMapping("/form/search")
	public String findname(Model model, @RequestParam("keyword") Optional<String> keyword) {
		// kiểm tra xem người dùng có truyền dữ liệu hay
		if (keyword.isPresent()) {
			// nếu khi dự liệu tìm kiếm không thấy thì trả về trang lỗi
			if (proDao.getProductByKeyword(keyword).isEmpty()) {
				String error = String.valueOf(keyword).replace("Optional", "").replace("[", "").replace("]", "");
				model.addAttribute("error", error);
				return "error/page_error";
			} else {
				// thực hiện tìm kiếm dữ liệu khi nó tồn tại
				List<product> prod = proDao.getProductByKeyword(keyword);
				model.addAttribute("list", prod);
			}
		} else {
			// nếu người dung không truyền dữ liệu trả về trang chủ
			return "redirect:/form/index";
		}
		return "form/index";
	}

}
