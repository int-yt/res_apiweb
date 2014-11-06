<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9MassDAO dao = new Use9MassDAO();
	Use9Mass oo = dao.findById(id);
%>
<body>
	<FORM name=use9_form action="<%=request.getContextPath()%>/admin/m.do?use9=update" method=post>
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center" valign="top">
					<br>
					<table width="650" border="0" cellpadding="2" cellspacing="1"
						class="table_southidc">
						<tr>
							<td height="25" class="back_southidc" colspan="2">
								<div align="center">
									<strong>留言详细信息 <br> </strong>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div align="center">
									<table width="100%" border="0" cellspacing="1" cellpadding="0">

										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													留言人:
												</div>
											</td>
											<td>
												<input type="text" maxlength="15" value="<%=oo.getName()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													所在公司:
												</div>
											</td>
											<td>
												<input type="text" size="25" maxlength="15" value="<%=oo.getCompany()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													留言时间:
												</div>
											</td>
											<td>
												<input type="text" id="content" maxlength="20" value="<%=oo.getTimes()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td width="20%" height="25">
												<div align="left">
													登录名:
												</div>
											</td>
											<td width="80%">
												<input type="text" size="20" maxlength="20" value="<%=oo.getLoginName()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													电话:
												</div>
											</td>
											<td height="10">
												<input type=text value="1">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													邮箱:
												</div>
											</td>
											<td bgcolor="#ECF5FF">
												<input type="text" maxlength="20" value="<%=oo.getEmail()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													移动电话:
												</div>
											</td>
											<td>
												<input type="text" id="content" maxlength="20" value="<%=oo.getMobile()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td height="22">
												<div align="left">
													留言标题:
												</div>
											</td>
											<td>
												<input type="text" id="content" size="40" maxlength="30" value="<%=oo.getTitle()%>">
											</td>
										</tr>
										<tr bgcolor="#ECF5FF" align="left">
											<td>
												<div align="left">
													留言内容:
												</div>
											</td>
											<td>
												<textarea cols="60" rows="8"><%=oo.getContent()%></textarea>
											</td>
										</tr>

									</table>
								</div>
							</td>
						</tr>
						<%
							if (1 == oo.getRemark()) {
						%>
						<tr>
							<td width="20%">
								回复如下：
							</td>
							<td>
								<textarea cols="60" rows="8" readonly><%=oo.getRecontent() %></textarea>
							</td>
						</tr>
						<tr bgcolor="#ECF5FF" align="center">
							<td height="25" colspan="2">
								<div align="center">
									<input type="button" value="返回" onclick="javascript:history.back(-1)">
								</div>
							</td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td width="20%">
								回复留言:
							</td>
							<td>
								<input name="mass.id" type="hidden" value="<%=oo.getId()%>">
								<textarea cols="60" rows="8"  name="mass.recontent"></textarea>
							</td>
						</tr>
						<tr bgcolor="#ECF5FF" align="center">
							<td height="25" colspan="2">
								<div align="center">
									<input type="button" value="提交回复" onclick="return checkReMass();">
									<input type="button" value="暂不回复" onclick="javascript:history.back(-1)">
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<br>
					<br>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>