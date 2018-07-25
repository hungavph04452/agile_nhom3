package hiber;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class hibernateUtil {
		private static final SessionFactory sessionFactory;
		static {
			try {
				sessionFactory = new AnnotationConfiguration().configure("hiber/hibernate.cfg.xml").buildSessionFactory();
			} catch (Exception e) {
				System.out.println("loi o day " + e);
				throw new  ExceptionInInitializerError(e);
			}
		}
		public static SessionFactory getSessionFactory() {
			return sessionFactory;
		}
		public static Session openSession() {
			return sessionFactory.openSession();
		}

}
