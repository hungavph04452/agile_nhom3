package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import hiber.*;
import entity.*;

public class accountDao {
	public static int checklog(String username, String password) {
		Session session = hibernateUtil.getSessionFactory().openSession();
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
	public static account getInfoAccount(int idAccount) {
		Session session = hibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		account ac= (account)session.get(account.class, idAccount);
		session.close();
		return ac;	
	}
	public static  List<account> getListAccount(int idAccount){
		List<account> list=new ArrayList<account>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from account";
		 if (idAccount > 0) {
			 hql += " where idAccount like '%" + idAccount + "%' ";
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
	@SuppressWarnings("unchecked")
	public static List<account> getListAccount2(String username,String fullname){
		List<account> list=new ArrayList<account>();
		Session  session =hibernateUtil.openSession();
		Transaction tr=null;
		try {
			tr = session.getTransaction();
			tr.begin();
		 String hql="from account";
		 if (username.length()>0) {
			 hql += " where username like '%" + username + "%' or fullname like '%" + fullname + "%'";
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
	public static boolean insertAccount(account ac) {
		if (accountDao.getInfoAccount(ac.getIdAccount()) !=null) {
			return false;
		}
		Session session= hibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(ac);
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
	
	public static boolean updateAccount(account ac) {
		if (accountDao.getInfoAccount(ac.getIdAccount()) ==null) {
		 return false;
		}
		Session session	= hibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			session.update(ac);
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
	public static boolean deleteAccount(int idAccount) {
		List<account> list=new ArrayList<account>();
			Session session = hibernateUtil.openSession();
			account ac= accountDao.getInfoAccount(idAccount);
			if (ac == null) {
				return false;
			}
			Transaction tr= null;
			try {
				tr = session.getTransaction();
				tr.begin();
				session.delete(ac);
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
	public  static boolean checkAccount(String username) {
		Session session	= hibernateUtil.getSessionFactory().getCurrentSession();
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
	public List<account> getAccount() {
		Session session	= hibernateUtil.getSessionFactory().getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			String hql = "from account";
			Query query = session.createQuery(hql);
			List<account> listAc = query.list();
			trans.commit();
			return listAc;
		} catch (Exception e) {
			trans.rollback();
		}
		return null;
	}
}
