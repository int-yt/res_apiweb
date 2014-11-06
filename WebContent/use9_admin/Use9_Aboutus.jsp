<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<BR>
				<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=556
					border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc width=550 height=25>
								<DIV align=center>
									<STRONG>栏目管理</STRONG>
								</DIV>
							</TD>
						</TR>
						<TR>
							<TD height=66>
								<DIV align=center>
									<TABLE class=border height=62 cellSpacing=1 cellPadding=0
										width="100%" align=center bgColor=#000000 border=0>
										<TBODY>
											<TR class=title bgColor=#ecf5ff>
												<TD align=center height=29>
													<STRONG>小栏目名称</STRONG>
												</TD>
												<TD align=center height=29>
													<STRONG>大栏目名称</STRONG>
												</TD>
												<TD align=center width=200>
													<STRONG>操作</STRONG>
												</TD>
											</TR>
											<%
													Use9AboutusDAO dao = new Use9AboutusDAO();
													List list = dao.findAll();
													for (Object aa : list) {
														Use9Aboutus oo = (Use9Aboutus) aa;
												%>
											<TR class=tdbg>
												<TD align=center bgColor=#ecf5ff height=28>
													<%=oo.getName() %>
												</TD>
												<TD align=center bgColor=#ecf5ff height=28>
													<%=oo.getUse9Aboutustype().getType() %>
												</TD>
												<TD align=center bgColor=#ecf5ff>
													<A href="<%=request.getContextPath() %>/use9_admin/Use9_AboutEdit.jsp?id=<%=oo.getId() %>">查看</A>&nbsp; &nbsp;
													<A href="<%=request.getContextPath() %>/use9_admin/Use9_AboutEdit.jsp?id=<%=oo.getId() %>">修改</A>&nbsp;&nbsp;
													<A onclick="return ConfirmDel();" href="<%=request.getContextPath()%>/admin/ab.do?use9=del&about.id=<%=oo.getId() %>">删除</A>
												</TD>
											</TR>
											<%} %>
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
