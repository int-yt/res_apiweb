<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.math.BigDecimal"%>
<%@ page language="java" import="com.use9.frame.hibernate.pojo.StreamSeaPinck"%>
<%@ page language="java" import="org.hibernate.*"%>
<%@ page language="java" import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" import="org.hibernate.classic.Session"%>
<%@ page language="java" import="net.sf.json.*"%>

<%
	JSONObject jsonObj = new JSONObject();
	String expressOutIds = request.getParameter("expressOutId");
	String []expressOutIdList = expressOutIds.split("\r"); 
	String userId = request.getParameter("userId");
	BigDecimal itemWeight = new BigDecimal(request.getParameter("itemWeight")); 
	Configuration config1 = new Configuration();
	SessionFactory sf = config1.configure().buildSessionFactory();
	Session session1 = sf.openSession();
	session1.getTransaction().begin();
	int i=0;
	for(String expressOutId:expressOutIdList) {
		i++;
		StreamSeaPinck streamSeaPinck = new StreamSeaPinck();
		streamSeaPinck.setExpressOutId(expressOutId);
		streamSeaPinck.setItemWeight(itemWeight);
		streamSeaPinck.setSaveDate(new Date());
		streamSeaPinck.setUserId(userId);
		session1.save(streamSeaPinck);
		if(i%4==0){   //每一千条刷新并写入数据库  
			session1.flush();  
			session1.clear();
			i = 0;
        }  
		
	}
	if(i !=0) {
		session1.flush();  
		session1.clear();
	}
	session1.getTransaction().commit();
	session1.close();
	jsonObj.put("msg","登记入库成功");
	out.println(jsonObj.toString());
%>