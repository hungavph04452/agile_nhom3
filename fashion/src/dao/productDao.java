package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.*;
import hiber.hibernateUtil;

public class productDao {
	public static product getInfoProduct(int idProduct) {
		Session session = hibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		product pt= (product)session.get(product.class, idProduct);
		session.close();
		return pt;	
	}
	
	public List<product> getProduct() {
		Session session	= hibernateUtil.getSessionFactory().getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			String hql = "from product";
			Query query = session.createQuery(hql);
			List<product> listP = query.list();
			trans.commit();
			return listP;
		} catch (Exception e) {
			trans.rollback();
		}
		return null;
	}
	public static boolean insertProduct(product p) {
		if (productDao.getInfoProduct(p.getIdProduct()) !=null) {
			return false;
		}
		Session session= hibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(p);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e);
			return false;
		}finally {
			session.close();
		}			
	}
	
	public static boolean updateProduct(product p) {
		if (productDao.getInfoProduct(p.getIdProduct()) ==null) {
		 return false;
		}
		Session session	= hibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			session.update(p);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e);
				return false;
		}finally {
			session.close();
		}
	}
	public static boolean deleteProduct(int idProduct) {
		List<product> list=new ArrayList<product>();
			Session session =hibernateUtil.openSession();
			product p= productDao.getInfoProduct(idProduct);
			if (p == null) {
				return false;
			}
			Transaction tr= null;
			try {
				tr = session.getTransaction();
				tr.begin();
				session.delete(p);
				tr.commit();
				return true;
			} catch (Exception e) {
				 if (tr !=null) {
					tr.rollback();
				}
				 e.printStackTrace();
				 return false;
			}finally {
			session.close();
		}
	}
	public static  List<product> getListProduct(int idProduct){
		List<product> listP=new ArrayList<product>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from product";
		 if (idProduct > 0) {
			 hql += " where idProduct="+idProduct;
		}
		 System.out.println(hql);
			listP = session.createQuery(hql).list();
			tr.commit();
		} catch (Exception e) {
			if (tr != null) {
				tr.rollback();
			}
			e.printStackTrace();
		}finally {
			session.close();
		}
		return listP;		
	}
	public static List<product> getListProductPage(List<product> list, int start, int end) {
		List<product> result = new ArrayList<product>();
		for (int i = start; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
	
	public static  List<product> getListProduct(String nameProduct){
		List<product> listP=new ArrayList<product>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from product";
		 if (nameProduct.length()>0) {
			 hql += " where nameProduct like '%" + nameProduct + "%' ";
		}
		 System.out.println(hql);
			listP = session.createQuery(hql).list();
			tr.commit();
		} catch (Exception e) {
			if (tr != null) {
				tr.rollback();
			}
			e.printStackTrace();
		}finally {
			session.close();
		}
		return listP;		
	}
}
