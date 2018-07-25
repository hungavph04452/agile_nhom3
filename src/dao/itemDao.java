package dao;

import java.util.ArrayList;
import java.util.List;

import entity.item;

public class itemDao {
	List<item> it=new ArrayList<>();
	public void insertItem (item ito) {
		for (item item : it) {
			if (ito.getPro().getIdProduct()!=item.getPro().getIdProduct()) {
				it.add(ito);
			}else {
				item.setQuantity(ito.getQuantity());
			}
		}
		
		
	}
	public void delItem(int id) {
		List<item> itfinal=new ArrayList<>();
		for (item item : it) {
			if(item.getPro().getIdProduct()!=id) {
				itfinal.add(item);
			}
		}
		it=itfinal;
	}
 }
