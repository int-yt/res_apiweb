<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=use9_form action="<%=request.getContextPath()%>/test.do?use9=save" method=post>
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top align="center">
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
						border=0>
						<TBODY>
							<TR>
								<TD class=back_southidc width=598 height=25>
									<DIV align=center>
										<STRONG>添加管理员</STRONG>
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
														管理员帐号：
													</DIV>
												</TD>
												<TD width="71%">
													<INPUT id=UserName maxLength=20 size=16
														name="admin.loginName">
												</TD>
											</TR>
											<TR>
												<TD height=22>
													<DIV align=right>
														管理员密码：
													</DIV>
												</TD>
												<TD>
													<INPUT type=password maxLength=20 size=16 id=password
														name="admin.loginPwd">
												</TD>
											</TR>
											<TR>
												<TD height=22>
													<DIV align=right>
														密码确认：
													</DIV>
												</TD>
												<TD>
													<INPUT type=password maxLength=20 size=16 id=rePassword
														name=rePassword>
												</TD>
											</TR>
											<TR>
												<TD colSpan=2 height=22>
													<DIV align=center>
														<INPUT type=button value=确认添加 name=Submit2 onclick="return form_onsubmit()">
													</DIV>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>

							</TR>
						</TBODY>
					</TABLE>
					<BR>
					<%
						Use9AdminDAO dao = new Use9AdminDAO();
						List list = dao.findAll();
					%>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
						border=0>
						<TBODY>
							<TR>
								<TD class=back_southidc width=553 height=25>
									<DIV align=center>
										<STRONG>管理员帐号管理</STRONG>
									</DIV>
								</TD>
							</TR>

							<TR class=tr_southidc>
								<TD>
									<BR>
									<TABLE cellSpacing=2 cellPadding=0 width="100%" align=center
										border=0>
										<TBODY>
											<TR bgColor=#a4b6d7>
												<TD width="28%" height=25>
													<DIV align=center>
														管理员帐号
													</DIV>
												</TD>
												<TD width="28%">
													<DIV align=center>
														管理员密码
													</DIV>
												</TD>
												<TD width="24%">
													<DIV align=center>
														操作
													</DIV>
												</TD>
												<TD width="20%">
													<DIV align=center>
														删除
													</DIV>
												</TD>
											</TR>
											<%
												for (Object aa : list) {
													Use9Admin oo = (Use9Admin) aa;
											%>
											<TR bgColor=#dfebf2>
												<TD height=22>
													<DIV align=center>
														<%=oo.getLoginName()%>
													</DIV>
												</TD>
												<TD>
													<DIV align=center>
														<%=oo.getLoginPwd()%>
													</DIV>
												</TD>
												<TD>
													<DIV align=center>
														<A href="<%=request.getContextPath()%>/use9_admin/Use9_AdminEdit.jsp?id=<%=oo.getId() %>">修改密码</A>
													</DIV>
												</TD>
												<TD>
													<DIV align=center>
														<A onclick="return ConfirmDel();"
															href="<%=request.getContextPath()%>/admin/ad.do?use9=del&admin.id=<%=oo.getId()%>">删除</A>
													</DIV>
												</TD>
											</TR>
											<%
												}
											%>
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
