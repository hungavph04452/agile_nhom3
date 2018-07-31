package poly.java4.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import poly.java4.entities.account;
import poly.java4.util.HibernateUtil;


public class AccountDao {
	@SuppressWarnings("unchecked")
	public static int checklog(String username, String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			List<account> list = null;
			
			session.beginTransaction();
			String hql ="from account where username= '" + username + "' and " + " password= '" + password + "'";
			Query query = session.createQuery(hql);
			list = query.list();
			
			if (list.size()>0) {
				return list.get(0).getRoles();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		 return -1;	
	}
	public  static boolean checkAccount(String username) {
		Session session	= HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			String hql = "from account where username='" + username + "'";
			Query query = session.createQuery(hql);
			account acc = (account) query.uniqueResult();
			trans.commit();
			if (acc != null) {
				return true;
			}
		} catch (Exception e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();		
		}
		return false;
	}
	public static List<account> getListAccountPage(List<account> list, int start, int end) {
		List<account> result = new ArrayList<account>();
		for (int i = start; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
}
