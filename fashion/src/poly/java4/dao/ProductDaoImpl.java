package poly.java4.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import poly.java4.entities.product;
import poly.java4.util.HibernateUtil;

public class ProductDaoImpl implements ProductDao {

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	@Override
	public void insertProduct(product p) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			session.save(p);
			trans.commit();
		} catch (HibernateException e) {
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
	public List<product> getListProduct() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		List<product> list = null;
		try {
			trans = session.beginTransaction();
			list = session.createQuery("from product ORDER BY idProduct DESC").list();
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

	@SuppressWarnings("unchecked")
	@Override
	public List<product> getListProductByProductType(int idProductType) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		List<product> list = null;
		try {
			trans = session.beginTransaction();
			list = session
					.createQuery("from product where idProductType='" + idProductType + "' ORDER BY idProduct ASC")
					.list();
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
	public product getProduct(int idProduct) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		product p = null;
		try {
			trans = session.beginTransaction();
			p = (product) session.createQuery("from product where idProduct='" + idProduct + "'").uniqueResult();
			trans.commit();
		} catch (HibernateException e) {
			if (trans != null) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return p;
	}

	@Override
	public List<product> getListProductByPagination(List<product> list, int start, int end) {
		// TODO Auto-generated method stub
		List<product> result = new ArrayList<product>();
		for (int i = start; i < end; i++) {
			result.add(list.get(i));
		}
		return result;
	}
}
