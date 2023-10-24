package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public interface CartDAO {

	public boolean addToCart(Cart c);

	public List<Cart> getBookByUser(int userid);

	public boolean deleteBook(int bid, int uid, int cid);

	public boolean deleteCartAfterOrder(int uid);
}
