package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.*;
import hiber.*;

public class detailInvoiceDao {
	public List<detailInvoice> getInvoice() {
		Session session	= hibernateUtil.getSessionFactory().getCurrentSession();
		Transaction trans = session.beginTransaction();
		try {
			String hql = "from detailInvoice";
			Query query = session.createQuery(hql);
			List<detailInvoice> listDetailIn = query.list();
			trans.commit();
			return listDetailIn;
		} catch (Exception e) {
			trans.rollback();
		}
		return null;
	}
}
