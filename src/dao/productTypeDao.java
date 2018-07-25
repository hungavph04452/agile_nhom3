package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.*;
import hiber.*;

public class productTypeDao {
	public static productType getInfoProductType(int idProductType) {
		Session session = hibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		productType pt= (productType)session.get(productType.class, idProductType);
		session.close();
		return pt;	
	}
	
	
	public static boolean insertProductType(productType pt) {
		if (productTypeDao.getInfoProductType(pt.getIdProductType()) !=null) {
			return false;
		}
		Session session= hibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(pt);
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
	
	public static boolean updateProductType(productType pt) {
		if (productTypeDao.getInfoProductType(pt.getIdProductType()) ==null) {
		 return false;
		}
		Session session	= hibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			session.update(pt);
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
	public static boolean deleteProductType(int idProductType ) {
		List<productType> list=new ArrayList<productType>();
			Session session =hibernateUtil.openSession();
			productType pt= productTypeDao.getInfoProductType(idProductType);
			if (pt == null) {
				return false;
			}
			Transaction tr= null;
			try {
				tr = session.getTransaction();
				tr.begin();
				session.delete(pt);
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
	public List<productType> getProductType() {
		Session session	= hibernateUtil.getSessionFactory().getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			String hql = "from productType";
			Query query = session.createQuery(hql);
			List<productType> listPt = query.list();
			trans.commit();
			return listPt;
		} catch (Exception e) {
			trans.rollback();
		}
		return null;
	}
	
	public static  List<productType> getListProductType(int idProductType){
		List<productType> list=new ArrayList<productType>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from productType";
		 if (idProductType>0) {
			 hql += " where idProductType like '%" + idProductType + "%' ";
		}
		 System.out.println(hql);
			list = session.createQuery(hql).list();
			tr.commit();
		} catch (Exception e) {
			if (tr != null) {
				tr.rollback();
			}
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;		
	}
	public static List<productType> getListProductTypePage(List<productType> list, int start, int end) {
		List<productType> result = new ArrayList<productType>();
		for (int i = start; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
	public static  List<productType> getListProductType2(String nameProductType){
		List<productType> list=new ArrayList<productType>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from productType";
		 if (nameProductType.length()>0) {
			 hql += " where nameProductType like '%" + nameProductType + "%' ";
		}
		 System.out.println(hql);
			list = session.createQuery(hql).list();
			tr.commit();
		} catch (Exception e) {
			if (tr != null) {
				tr.rollback();
			}
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;		
	}
}
