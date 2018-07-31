package poly.java4.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import poly.java4.entities.invoice;
import poly.java4.util.HibernateUtil;

public class SearchDao {
	@SuppressWarnings("unused")
	public static List<invoice> getListInvoiceSearch(String name) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.openSession();
		Transaction trans = null;
		invoice in = null;
		try {
			trans = session.getTransaction();
			trans.begin();
			String hql = "from invoice";
			if (name.length() > 0) {
				hql = hql + " where name like '%" + name + "%'";
			}
			System.out.println(hql);
			in = (invoice) session.createQuery(hql).uniqueResult();
			trans.commit();
		} catch (Exception e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
