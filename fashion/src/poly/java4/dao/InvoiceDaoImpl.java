package poly.java4.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import poly.java4.entities.invoice;
import poly.java4.util.HibernateUtil;

public class InvoiceDaoImpl implements InvoiceDao {

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void addInvoice(invoice inv) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		try {
			session = sessionFactory.openSession();
			trans = session.beginTransaction();
			session.save(inv);
			trans.commit();
		} catch (HibernateException e) {
			// TODO: handle exception
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<invoice> getListInvoice() {
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		List<invoice> list = null;
		try {
			trans = session.beginTransaction();
			list = session.createQuery("from invoice ORDER BY idInvoice DESC").list();
			trans.commit();
		} catch (HibernateException e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public void updateInvoice(invoice inv) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trans = null;
		try {
			trans = session.getTransaction();
			trans.begin();
			session.update(inv);
			trans.commit();
		} catch (Exception e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public invoice getInvoice(int idInvoice) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		invoice i = null;
		try {
			trans = session.beginTransaction();
			i = (invoice) session.createQuery("from invoice where idInvoice='" + idInvoice + "'").uniqueResult();
			trans.commit();
		} catch (HibernateException e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return i;
	}

}
