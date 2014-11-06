<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<%
if (request.getParameter(USE9.parm) != null) {
		USE9.curpage = Integer.parseInt(request.getParameter(USE9.parm));
	}
	Use9VipDAO dao = new Use9VipDAO();
	LogBean bean = dao.findAll(USE9.curpage, USE9.pageSize, USE9.href);
	
	List<Use9Vip> list = bean.getList();
%>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<BR>
				<BR>
				<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=600
					border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc height=25>
								<DIV align=center>
									注册会员管理
								</DIV>
							</TD>
						</TR>
						<TR>
							<TD height=25>
								<DIV align=center>
									<TABLE class=border cellSpacing=1 cellPadding=0 width=600
										align=center bgColor=#000000 border=0>
										<TBODY>
											<TR class=title bgColor=#a4b6d7>
												<TD align=center width=20% height=25>
													登录名
												</TD>
												<TD align=center width=20% height=25>
													用户名
												</TD>
												<TD align=center width=10% height=25>
													性别
												</TD>
												<TD align=center width=20% height=25>
													Email
												</TD>
												<TD align=center width=30% height=25 colspan="3">
													操作
												</TD>
											</TR>
											<%
												for(Use9Vip oo :list){ 
													Use9Vip info = oo;
											%>
											<TR class=tdbg>
												<TD align=center bgColor=#ecf5ff height=22>
													<%=info.getLoginName() %>
												</TD>
												<TD align=center bgColor=#ecf5ff>
													<%=info.getUseName() %>
												</TD>
												<TD align=center bgColor=#ecf5ff>
													<% 
													if(1 == info.getSex())
													{
														out.print("男");
													}else{
														out.print("女");
													} %>
												</TD>
												<TD bgColor=#ecf5ff align="center">
													<A href=""><%=info.getEmail() %></A>
												</TD>
												<TD align=center bgColor=#ecf5ff>
													<% 
														if(1 == info.getMark()){
													%>
														<a href="<%=request.getContextPath()%>/admin/v.do?use9=update2&vip.mark=0&vip.id=<%=oo.getId() %>"><font color="#ff0000">通过</font></a>
													<% }else{%>
														<a href="<%=request.getContextPath()%>/admin/v.do?use9=update2&vip.mark=1&vip.id=<%=oo.getId() %>"><font color="#ff0000">锁定</font></a>
													<% } %>
												</TD>
												<TD align=center bgColor=#ecf5ff>
													<A href="<%=request.getContextPath() %>/use9_admin/Use9_UserEdit.jsp?id=<%=oo.getId() %>">修改</A>
												</TD>
												<TD align=center bgColor=#ecf5ff>
													<A onclick="return ConfirmDel();" href="<%=request.getContextPath()%>/admin/v.do?use9=del&vip.id=<%=oo.getId()%>">删除</A>
												</TD>
											</TR>
											<%} %>
										</TBODY>
									</TABLE>
									<TABLE align=center>
										<TBODY>
											<TR>
												<TD>
														<%
															if (bean != null)
																out.print(bean.getStrPage());
														%>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>