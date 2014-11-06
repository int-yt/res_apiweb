package com.use9.frame.hibernate.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public class Test {
	public static void main(String[] args) {
		Configuration config = new Configuration();
		SessionFactory sf = config.configure().buildSessionFactory();
		Session session = sf.openSession();
		// session.getTransaction().begin();
		String hql = "from ApiKcb as api_kcb";
		Query query = session.createQuery(hql);
		List<ApiKcb> list = query.list();
		
		/*for (ApiKcb apiKcb : list) {
			if(apiKcb.getApiTime() != null) {
				DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String apiTime = fmt.format(apiKcb.getApiTime());
			}
			if(apiKcb.getUpdateTime() != null) {
				DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String apiTime = fmt.format(apiKcb.getApiTime());
			}
		}*/
		
		net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray
				.fromObject(list);
		System.out.println(jsonArray.toString());
		session.close();
	}
}
