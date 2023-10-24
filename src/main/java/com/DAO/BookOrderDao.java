package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDao {

	public boolean SaveOrder(List<BookOrder> bo);
	
	public List<BookOrder> getOrders(String email);
	
	public List<BookOrder> getOrdersAdmin();
}
