<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9NewtypeDAO dao = new Use9NewtypeDAO();
	Use9Newtype oo = dao.findById(id);
%>
<FORM name=use9_form action="<%=request.getContextPath()%>/admin/nt.do?use9=update" method=post>
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top align="center">
					<BR>
					<STRONG><BR> </STRONG>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
						border=0>
						<TBODY>
							<TR>
								<TD class=back_southidc width=598 height=25>
									<DIV align=center>
										<STRONG>修改新闻分类</STRONG>
									</DIV>
								</TD>
							</TR>
							<TR class=tr_southidc>
								<TD>
									<TABLE width="50%" align=center border=0>
										<TBODY>
											<TR>
												<TD colSpan=2 height=25>
													&nbsp;
												</TD>
											</TR>
											<TR>
												<TD width="29%" height=22>
													<DIV align=right>
													分类名称：
													</DIV>
												</TD>
												<TD width="71%">
													<INPUT type="hidden" name="newtype.id" value="<%=oo.getId() %>">
													<INPUT readonly value="<%=oo.getName() %>">
												</TD>
											</TR>
											<TR>
												<TD width="29%" height=22>
													<DIV align=right>
													修改成：
													</DIV>
												</TD>
												<TD width="71%">
													<INPUT id=UserName maxLength=20 size=16
														name="newtype.name">
												</TD>
											</TR>
											<TR>
												<TD colSpan=2 height=22>
													<DIV align=center>
														<INPUT type=submit value=确认修改 name=Submit2  onclick="return checkBig()">
													</DIV>
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
</FORM>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>
