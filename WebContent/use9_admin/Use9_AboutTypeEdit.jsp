<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9AboutustypeDAO dao = new Use9AboutustypeDAO();
	Use9Aboutustype oo = dao.findById(id);
%>
<FORM name=use9_form action="<%=request.getContextPath()%>/admin/abt.do?use9=update" method=post>
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
										<STRONG>修改大栏目分类</STRONG>
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
												<TD width="35%" height=22>
													<DIV align=right>
														大栏目名称：
													</DIV>
												</TD>
												<TD width="65%">
													<INPUT name="abouttype.id" type="hidden" value="<%=oo.getId() %>">
													<INPUT readonly type="text" value="<%=oo.getType() %>">
												</TD>
											</TR>
											<TR>
												<TD width="29%" height=22>
													<DIV align=right>
														修改成:
													</DIV>
												</TD>
												<TD width="71%">
													<INPUT id=UserName maxLength=20 size=16
														name="abouttype.type">
												</TD>
											</TR>
											<TR>
												<TD colSpan=2 height=22>
													<DIV align=center>
														<INPUT type=button value=确认修改 name=Submit2 onclick="return checkBig()">
														<INPUT type=button value=取消返回 name=Submit2 onclick="javascript:history.back(-1)">
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