<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.*"%>
<%@ page language="java" import="java.text.*"%>

<%@ page language="java" import="org.hibernate.*"%>
<%@ page language="java" import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" import="org.hibernate.classic.Session"%>
<%@ page language="java" import="com.use9.frame.hibernate.pojo.*"%>
<%@ page language="java" import="com.use9.util.DateJsonValueProcessor"%>

<%
	JSONObject jsonObj = new JSONObject();
	if (request.getParameter("action") != null) {//查询
		if (request.getParameter("action").equals("query")) {
	int taskId = Integer.parseInt(request.getParameter("id"));
	Configuration config1 = new Configuration();
	SessionFactory sf = config1.configure()
			.buildSessionFactory();
	Session session1 = sf.openSession();
	String hql = "from ApiDygx  ";
	Query query = session1.createQuery(hql);
	query.setFirstResult(0);
	query.setMaxResults(1000);
	int curPage = Integer.parseInt(request
			.getParameter("pageNum"));
	int pageSize = 15; //每页显示数 
	int total = query.list().size(); //总条数
	int totalPage = (int) Math.ceil(total / pageSize); //总页数
	int startPage = (curPage - 1) * pageSize;
	//查询明细
	query = session1.createQuery(hql);
	query.setFirstResult(startPage);
	query.setMaxResults(pageSize);
	List<ApiDygx> list = query.list();
	net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray
			.fromObject(list);

	session1.close();
	JsonConfig jf = new JsonConfig();
	jf.registerJsonValueProcessor(java.util.Date.class,
			new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));//时间格式转换
	JSONArray newjsonArray = jsonArray.fromObject(list,jf);
	jsonObj.put("list", newjsonArray);
	jsonObj.put("total", total);
	jsonObj.put("pageSize", pageSize);
	jsonObj.put("totalPage", totalPage);
	out.println(jsonObj.toString());
		}  else if (request.getParameter("action").equals("search")) {
	String hh = request.getParameter("hh");
	Configuration config1 = new Configuration();
	SessionFactory sf = config1.configure()
			.buildSessionFactory();
	Session session1 = sf.openSession();
	String hql = "from ApiDygx  where NumIID =:hh";
	Query query = session1.createQuery(hql);
	query.setString("hh", hh);
	List<ApiDygx> list = query.list();
	net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray
			.fromObject(list);
	int pageSize = 1; //每页显示数 
	int total = query.list().size(); //总条数
	session1.close();
	JsonConfig jf = new JsonConfig();
	jf.registerJsonValueProcessor(java.util.Date.class,
			new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));//时间格式转换
	JSONArray newjsonArray = jsonArray.fromObject(list,jf);
	jsonObj.put("list", newjsonArray);
	jsonObj.put("total", total);
	jsonObj.put("pageSize", pageSize);
	jsonObj.put("totalPage", 1);
	out.println(jsonObj.toString());
		} 
	}
%>