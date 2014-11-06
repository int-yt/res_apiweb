<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<%
if (request.getParameter(USE9.parm) != null) {
		USE9.curpage = Integer.parseInt(request.getParameter(USE9.parm));
	}
	Use9MassDAO dao = new Use9MassDAO();
	LogBean bean = dao.findAll(USE9.curpage, USE9.pageSize, USE9.href);
	
	List<Use9Mass> list = bean.getList();
%>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<BR>
				<STRONG><BR> </STRONG>
				<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
					border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc height=25>
								<DIV align=center>
									<STRONG>留言管理 <BR> </STRONG>
								</DIV>
							</TD>
						</TR>
						<TR>
							<TD height=16>
								<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
									<TBODY>
										<TR class=tr_southidc bgColor=#a4b6d7>
											<TD width="20%" height=25>
												<DIV align=center>
													留言人
												</DIV>
											</TD>
											<TD width="20%">
												<DIV align=center>
													联系电话
												</DIV>
											</TD>
											<TD width="15%">
												<DIV align=center>
													邮箱
												</DIV>
											</TD>
											<TD width="20%">
												<DIV align=center>
													留言时间
												</DIV>
											</TD>
											<TD width="25%" colspan="2">
												<DIV align=center>
													操作
												</DIV>
											</TD>
										</TR>
										<%
											for(Use9Mass oo:list){
												Use9Mass info = oo;
										 %>
										<TR bgColor=#ecf5ff>
											<TD>
												<DIV align=center>
													<%=info.getName() %>
												</DIV>
											</TD>
											<TD>
												<DIV align=center>
													<%=info.getTel() %>
												</DIV>
											</TD>
											<TD>
												<DIV align=center>
													<%=info.getEmail() %>
												</DIV>
											</TD>										
											<TD>
												<DIV align=center>
													<%=info.getTimes() %>
												</DIV>
											</TD>
											
											<TD>
												<DIV align=center>
												<%
												if(1 == info.getRemark()){ %>
													<a href="<%=request.getContextPath() %>/use9_admin/Use9_MassRe.jsp?id=<%=info.getId() %>">已回复,查看详情</a>
												<% }else{ %>
													<a href="<%=request.getContextPath() %>/use9_admin/Use9_MassRe.jsp?id=<%=info.getId() %>"><FONT color=#ff0000>进行回复</FONT></a>
												<%} %>
												</DIV>
											</TD>
											<TD>
												<DIV align=center>
													<A onclick="return ConfirmDel();" href="<%=request.getContextPath() %>/admin/m.do?use9=del&mass.id=<%=info.getId() %>">删除</A>
												</DIV>
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
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>