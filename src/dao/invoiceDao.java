package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.*;
import hiber.*;

public class invoiceDao {
	public static invoice getInfoInvoice(int idInvoice) {
		Session session = hibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		invoice in= (invoice)session.get(invoice.class, idInvoice);
		session.close();
		return in;	
	}
	public List<invoice> getInvoice() {
		Session session	= hibernateUtil.getSessionFactory().getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			String hql = "from invoice";
			Query query = session.createQuery(hql);
			List<invoice> listIn = query.list();
			trans.commit();
			return listIn;
		} catch (Exception e) {
			trans.rollback();
		}
		return null;
	}
	public static boolean updateInvoice(invoice in) {
		if (invoiceDao.getInfoInvoice(in.getIdInvoice()) ==null) {
		 return false;
		}
		Session session	= hibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			session.update(in);
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
	public static  List<invoice> getListInvoice(int idInvoice){
		List<invoice> list=new ArrayList<invoice>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from invoice";
		 if (idInvoice>0) {
			 hql += " where idInvoice like '%" + idInvoice + "%' ";
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
