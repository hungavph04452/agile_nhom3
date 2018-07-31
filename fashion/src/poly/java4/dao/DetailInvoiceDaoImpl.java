package poly.java4.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import poly.java4.entities.detailInvoice;
import poly.java4.util.HibernateUtil;

public class DetailInvoiceDaoImpl implements DetailInvoiceDao{

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	@Override
	public void insertDetailInvoice(detailInvoice dinv) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		try {
			session = sessionFactory.openSession();
			trans = session.beginTransaction();
			session.save(dinv);
			trans.commit();
		} catch (HibernateException e) {
			// TODO: handle exception
			if(trans!=null) {
				trans.rollback();
			}
			e.printStackTrace();
		}finally {
			session.close();
		}
	}

}
