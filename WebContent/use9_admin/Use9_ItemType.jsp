<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=form_admin onsubmit="return form_onsubmit()"
	action="<%=request.getContextPath()%>/admin/ot.do?use9=save"
	method=post>
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
										<STRONG>添加服务项目</STRONG>
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
													项目名称：
													</DIV>
												</TD>
												<TD width="71%">
													<INPUT id=UserName maxLength=20 size=16
														name="objecttype.name">
												</TD>
											</TR>
											<TR>
												<TD colSpan=2 height=22>
													<DIV align=center>
														<INPUT type=submit value=确认添加 name=Submit2 onclick="return checkBig();">
													</DIV>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>

							</TR>
						</TBODY>
					</TABLE>
					<br>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
						border=0>
						<TBODY>
							<TR>
								<TD class=back_southidc width=553 height=25>
									<DIV align=center>
										<STRONG>管理服务项目信息</STRONG>
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
												<TD width="50%" height=25>
													<DIV align=center>
														项目名称
													</DIV>
												</TD>
												<TD width="50%" colspan="2">
													<DIV align=center>
														操作
													</DIV>
												</TD>
												
											</TR>
											<%
												Use9ObjecttypeDAO dao = new Use9ObjecttypeDAO();
												List list = dao.findAll();
												for (Object aa : list) {
													Use9Objecttype oo = (Use9Objecttype) aa;
											%>
											<TR bgColor=#dfebf2>
												<TD height=22>
													<DIV align=center>
														<%=oo.getName() %>
													</DIV>
												</TD>	
												<TD>
													<DIV align=center>
														<A href="<%=request.getContextPath() %>/use9_admin/Use9_ItemTypeEdit.jsp?id=<%=oo.getId() %>">修改</A>
													</DIV>
												</TD>
												<TD>
													<DIV align=center>
														<A onclick="return ConfirmDel();" href="<%=request.getContextPath()%>/admin/ot.do?use9=del&objecttype.id=<%=oo.getId() %>">删除</A>
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
