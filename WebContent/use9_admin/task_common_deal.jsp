<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="net.sf.json.JSONObject"%>
<%@ page language="java" import="java.text.*"%>

<%@ page language="java" import="org.hibernate.SessionFactory"%>
<%@ page language="java" import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" import="org.hibernate.classic.Session"%>
<%@ page language="java" import="com.use9.frame.hibernate.pojo.*"%>
<%@ page language="java" import="com.use9.util.MD5Util"%>

<%
	JSONObject jsonObj = null;
	jsonObj = new JSONObject();
	int taskId = Integer.parseInt(request.getParameter("id"));
	if (request.getParameter("action") != null) {//更新
		if (request.getParameter("action").equals("query")) {
			Configuration config1 = new Configuration();
			SessionFactory sf = config1.configure()
					.buildSessionFactory();
			Session session1 = sf.openSession();
			ApiuUloadTaskInfo taskInfo = (ApiuUloadTaskInfo) session1
					.get(ApiuUloadTaskInfo.class, taskId);
			jsonObj.put("task_type", taskInfo.getTaskType());
			jsonObj.put("valid", taskInfo.getValid());
			Date startTimeDate = taskInfo.getStartTime();
			DateFormat fmt = new SimpleDateFormat("HH:mm:ss");
			String startTime = fmt.format(startTimeDate);
			jsonObj.put("start_time", startTime);
			jsonObj.put("period", taskInfo.getPeriod());
			out.println(jsonObj.toString());
		} else if (request.getParameter("action").equals("save")) {
			int valid = Integer.parseInt(request.getParameter("valid"));
			int taskType = Integer.parseInt(request
					.getParameter("task_type"));
			String startTime = request.getParameter("start_time");
			DateFormat fmt = new SimpleDateFormat("HH:mm:ss");
			Date startTimeDate = fmt.parse(startTime);
			int period = Integer.parseInt(request
					.getParameter("period"));
			if (taskType == 0) {
				//每天执行一次
				period = 24 * 60;
			}

			///md5
			String md5 =MD5Util.MD5(startTime + taskType + valid +period);
			Configuration config1 = new Configuration();
			SessionFactory sf = config1.configure()
					.buildSessionFactory();
			Session session1 = sf.openSession();
			session1.getTransaction().begin();
			ApiuUloadTaskInfo taskInfo = (ApiuUloadTaskInfo) session1
					.get(ApiuUloadTaskInfo.class, taskId);
			taskInfo.setPeriod(period);
			taskInfo.setStartTime(startTimeDate);
			taskInfo.setTaskType(taskType);
			taskInfo.setValid(valid);
			taskInfo.setMd5(md5);
			try {
				session1.update(taskInfo);
				session1.getTransaction().commit();
				session1.close();
				jsonObj.put("result", "保存成功");
			} catch (Exception ex) {
				jsonObj.put("result", "保存失败");
				ex.printStackTrace();
			}
			out.println(jsonObj.toString());

		}
	}
%>