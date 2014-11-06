<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.JSONObject"%>
<%@ page language="java" import="java.text.*"%>

<%@ page language="java" import="org.hibernate.*"%>
<%@ page language="java" import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" import="org.hibernate.classic.Session"%>
<%@ page language="java" import="com.use9.frame.hibernate.pojo.*"%>

<%
	JSONObject jsonObj = new JSONObject();
	if (request.getParameter("action") != null) {//查询
		if (request.getParameter("action").equals("query")) {
			int taskId = Integer.parseInt(request.getParameter("id"));
			Configuration config1 = new Configuration();
			SessionFactory sf = config1.configure().buildSessionFactory();
			Session session1 = sf.openSession();
			String hql = "from ApiSp as api_sp order by apiTime desc";
			Query query = session1.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(1000);
			int curPage = Integer.parseInt(request.getParameter("pageNum"));
			int pageSize = 15; //每页显示数 
			int total = query.list().size(); //总条数
			int totalPage = (int)Math.ceil(total/pageSize); //总页数
			int startPage = (curPage-1) *pageSize;   
			//查询明细
			query = session1.createQuery(hql);
			query.setFirstResult(startPage);
			query.setMaxResults(pageSize);
			List<ApiSp> list = query.list();
			net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray
					.fromObject(list);
			
			session1.close();
			jsonObj.put("list",jsonArray);
			jsonObj.put("total",total);
			jsonObj.put("pageSize",pageSize);
			jsonObj.put("totalPage",totalPage);
			out.println(jsonObj.toString());
		} else if (request.getParameter("action").equals("modify")) {
			int taskId = Integer.parseInt(request.getParameter("id"));
			Date updateTime = new Date();
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String updateTimeStr = fmt.format(updateTime);
			Configuration config1 = new Configuration();
			SessionFactory sf = config1.configure()
					.buildSessionFactory();
			Session session1 = sf.openSession();
			session1.getTransaction().begin();
			ApiSp apiSp = (ApiSp) session1
					.get(ApiSp.class, taskId);
			apiSp.setZt(0);
			apiSp.setUpdateTime(new Date());
			try {
				session1.update(apiSp);
				session1.getTransaction().commit();
				session1.close();
				jsonObj.put("code", "0");
				jsonObj.put("update_time", updateTimeStr);
			} catch (Exception ex) {
				jsonObj.put("code", "1");
				ex.printStackTrace();
			}
			out.println(jsonObj.toString());

		} else if (request.getParameter("action").equals("search")) {
			String hh = request.getParameter("hh");
			Configuration config1 = new Configuration();
			SessionFactory sf = config1.configure().buildSessionFactory();
			Session session1 = sf.openSession();
			String hql = "from ApiSp as api_sp where hh =:hh";
			Query query = session1.createQuery(hql);
			query.setString("hh", hh);
			List<ApiSp> list = query.list();
			net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray
					.fromObject(list);
			int pageSize = 1; //每页显示数 
			int total = query.list().size(); //总条数
			session1.close();
			jsonObj.put("list",jsonArray);
			jsonObj.put("total",total);
			jsonObj.put("pageSize",pageSize);
			jsonObj.put("totalPage",1);
			out.println(jsonObj.toString());
		} else if (request.getParameter("action").equals("modifyAll")) {
			Date updateTime = new Date();
			DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String updateTimeStr = fmt.format(updateTime);
			Configuration config1 = new Configuration();
			SessionFactory sf = config1.configure()
					.buildSessionFactory();
			Session session1 = sf.openSession();
			session1.getTransaction().begin();
			String hql = "update ApiSp set zt = 0,updateTime= :newDate where zt =1 and hk !=0";
			Query query = session1.createQuery(hql);
			query.setDate("newDate", new Date());
			int ret=query.executeUpdate();
			session1.getTransaction().commit();
			System.out.println(ret);

		}
	}
%>