package com.use9.frame.hibernate.pojo;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

import com.use9.util.DateJsonValueProcessor;

public class Test {
	public static void main(String[] args) {
		Configuration config = new Configuration();
		SessionFactory sf = config.configure().buildSessionFactory();
		Session session = sf.openSession();
		// session.getTransaction().begin();
		String hql = "from ApiTradeList ";
		Query query = session.createQuery(hql);
		List<ApiTradeList> list = query.list();

		/*
		 * for (ApiKcb apiKcb : list) { if(apiKcb.getApiTime() != null) {
		 * DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String
		 * apiTime = fmt.format(apiKcb.getApiTime()); }
		 * if(apiKcb.getUpdateTime() != null) { DateFormat fmt = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String apiTime =
		 * fmt.format(apiKcb.getApiTime()); } }
		 */

		JSONObject jsonObj = new JSONObject();
		net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray
				.fromObject(list);
		JsonConfig jf = new JsonConfig();
		jf.registerJsonValueProcessor(java.sql.Timestamp.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		jf.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONArray fromObject = jsonArray.fromObject(list,jf);
		jsonObj.put("list", fromObject);
		jsonObj.put("total", 100);
		
		System.out.println(jsonObj.toString());
		session.close();
	}
}
