package org.protectedog.web.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.service.cart.CartService;
import org.protectedog.service.domain.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	/// Field
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;

	public CartController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	// 1. ��ٱ��� �߰�
	@RequestMapping("addCart")
	public String addCart(@ModelAttribute("cart")Cart cart, HttpSession session) throws Exception{
	
		String id = (String) session.getAttribute("userId");
		cart.setId(id);
		
		
		// ��ٱ��Ͽ� ���� ��ǰ�� �ִ��� �˻�
		int count = cartService.countCart(cart.getProdNo(), id);
		//count == 0 ? cartService.updateCart(cart) : cartService.addCart(cart);
		if(count == 0){
			// ������ insert
		cartService.addCart(cart);
		
		} else {
			// ������ update
		cartService.updateCart(cart);
		}
		return "redirect:/shop/cart/listCart";
		}

	// 2. ��ٱ��� ���
	@RequestMapping("listCart")
	public String listCart(HttpSession session, Model model) throws Exception {

		String id = (String) session.getAttribute("id"); // session�� ����� userId
		Map<String, Object> map = new HashMap<String, Object>();
		List<Cart> list = cartService.listCart(id); // ��ٱ��� ����
		int totalPrice = cartService.totalPrice(id); // ��ٱ��� ��ü �ݾ� ȣ��

		map.put("count", list.size()); // ��ٱ��� ��ǰ�� ����
		map.put("totalPrice", totalPrice); // ��ٱ��� ��ü �ݾ�

		model.addAttribute("map", map);
		return "cart/listCart";
	}

	// 3. ��ٱ��� ����
	@RequestMapping("delCart")
	public String delCart(@RequestParam int cartNo) throws Exception{
	cartService.delCart(cartNo);
	return "redirect:/cart/listCart";
	}

	// 4. ��ٱ��� ����
	@RequestMapping("updateCart")
	public String updateCart(@RequestParam int[] quantity, @RequestParam int[] prodNo, HttpSession session) throws Exception {
	// session�� id
	String id = (String) session.getAttribute("id");
	// ���ڵ��� ���� ��ŭ �ݺ��� ����
	for(int i=0; i<prodNo.length; i++){

	
	Cart cart = new Cart();
	
	cart.setId(id);
	cart.setQuantity(quantity[i]);
	cart.setProdNo(prodNo[i]);
	cartService.modifyCart(cart);
	}
	return "redirect:/shop/cart/listCart";
	}
}
