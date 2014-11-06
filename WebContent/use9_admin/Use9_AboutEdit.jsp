<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.log.tools.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9AboutusDAO dao = new Use9AboutusDAO();
	Use9Aboutus oo = dao.findById(id);
	String str = oo.getContent();
%>
<body onload="eWebEditor.setHTML('<%=Tools.toHtml(str) %>')">
	<form method="post" name="myform"
		action="<%=request.getContextPath()%>/admin/ab.do?use9=update">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center" valign="top">
					<br>
					<table width="560" border="0" cellpadding="2" cellspacing="1"
						class="table_southidc">
						<tr>
							<td height="25" class="back_southidc">
								<div align="center">
									<strong>修改栏目<br> </strong>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div align="center">
									<table width="100%" border="0" cellspacing="1" cellpadding="0">
										<tr bgcolor="#ECF5FF">
											<td width="16%" height="23" bgcolor="#ECF5FF">
												<div align="center">
													大栏目名称:
												</div>
											</td>
											<td width="34%" height="25" align="left">
												<SELECT name=logbean.mark>
												<%
													Use9AboutustypeDAO daot = new Use9AboutustypeDAO();
													List list1 = daot.findAll();
													for (Object aa : list1) {
														Use9Aboutustype oot = (Use9Aboutustype) aa;
												%>
												<OPTION value="<%=oot.getId()%>" selected>
													<%=oot.getType() %>
												</OPTION>
												<%
													}
												%>
												</SELECT>
											</td>
											<td width="16%" height="25">
											小栏目名称:
										</td>
										<td width="34%" height="25" align="left">
											<input name="about.name" type="text" value="<%=oo.getName() %>">
										</td>
										</tr>
										<tr bgcolor="#ECF5FF">
											<td height="25" colspan="6">
												<div align="center">
													栏目内容
												</div>
											</td>
										</tr>
										<tr bgcolor="#ECF5FF">
											<td height="300" colspan="6">
												<input type="hidden" name="about.id" value="<%=oo.getId() %>">
												<input type="hidden" name="about.content" id="content">
												<iframe ID="eWebEditor"
													src="<%=request.getContextPath()%>/use9_admin/eWebEditor/ewebeditor.htm?id=content&style=coolblue"
													frameborder="0" scrolling="no" width="550" HEIGHT="450"></iframe>
											</td>
										</tr>
										<tr bgcolor="#ECF5FF">
											<td colspan="6">
												<div align="center">
													<input name="submit" type="submit" value="确定修改"
														onclick="content.value = eWebEditor.getHTML();">
													&nbsp;
													<input name="reset" type="reset" value="取消修改">
												</div>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
					<br>
				</td>
			</tr>
		</table>
	</form>
</body>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>