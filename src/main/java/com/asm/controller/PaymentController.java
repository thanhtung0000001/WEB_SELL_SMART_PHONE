package com.asm.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
 
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
 

import com.asm.ConfigPayment;
import com.asm.entity.product;
import com.asm.service.CartService;

@Controller
public class PaymentController {

	@Autowired
	CartService cartService;

	 
	@SuppressWarnings("unchecked")
	@GetMapping("/create_payment")
	public String creatPayment() throws UnsupportedEncodingException {

		String vnp_TxnRef = ConfigPayment.getRandomNumber(8);
		String vnp_IpAddr = "127.0.0.1";

		String vnp_TmnCode = ConfigPayment.vnp_TmnCode;

		List<Integer> giaSP = new ArrayList<>();
		for (product item : cartService.getAllProduct()) {
			Integer gia = item.getGiasp() * 100;
			giaSP.add(gia);
		}

		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", ConfigPayment.vnp_Version);
		vnp_Params.put("vnp_Command", ConfigPayment.vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(giaSP).replace("[", "").replace("]", ""));
		vnp_Params.put("vnp_CurrCode", "VND");
		vnp_Params.put("vnp_BankCode", "NCB");
		vnp_Params.put("vnp_Locale", "vn");
		vnp_Params.put("vnp_OrderType", ConfigPayment.orderType);
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
		vnp_Params.put("vnp_ReturnUrl", ConfigPayment.vnp_ReturnUrl);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		cld.add(Calendar.MINUTE, 15);
		String vnp_ExpireDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
		@SuppressWarnings("rawtypes")
		
		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		@SuppressWarnings("rawtypes")
		
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = ConfigPayment.hmacSHA512(ConfigPayment.secretKey, hashData.toString());
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = ConfigPayment.vnp_PayUrl + "?" + queryUrl;

		return "redirect:" + paymentUrl;
	}

}
