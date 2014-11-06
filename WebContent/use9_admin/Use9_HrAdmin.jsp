<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<BR>
				<BR>
				<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
					border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc height=25>
								<DIV align=center>
									<STRONG>招 聘 管 理 <BR> </STRONG>
								</DIV>
							</TD>
						</TR>
						<TR>
							<TD>
								<DIV align=center>
									<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
										<TBODY>
											<TR bgColor=#a4b6d7>
												<TD width="8%" height=25>
													<DIV align=center>
														ID
													</DIV>
												</TD>
												<TD width="30%">
													<DIV align=center>
														招聘对象
													</DIV>
												</TD>
												<TD width="10%">
													<DIV align=center>
														招聘人数
													</DIV>
												</TD>
												<TD width="20%">
													<DIV align=center>
														发布时间
													</DIV>
												</TD>
												<TD width="10%">
													<DIV align=center>
														有效期限
													</DIV>
												</TD>
												<TD colSpan=2>
													<DIV align=center></DIV>
													<DIV align=center>
														操 作
													</DIV>
												</TD>
											</TR>
											<%
												Use9JobDAO dao = new Use9JobDAO();
												List list = dao.findAll();
												for (Object aa : list) {
													Use9Job oo = (Use9Job) aa;
											%>
											<TR bgColor=#ecf5ff>
												<TD height=25>
													<DIV align=center>
														<%=oo.getId() %>
													</DIV>
												</TD>
												<TD align=center>
														<%=oo.getPerson() %>
												</TD>
												<TD>
													<DIV align=center>
														<%=oo.getNumber() %>&nbsp;人
													</DIV>
												</TD>
												<TD>
													<DIV align=center>
														<%=oo.getTimes() %>
													</DIV>
												</TD>
												<TD>
													<DIV align=center>
														<%=oo.getDayLimit() %>&nbsp;天
													</DIV>
												</TD>
												<TD width="11%">
													<DIV align=center>
														<A
															href="<%=request.getContextPath() %>/use9_admin/Use9_HrJobEdit.jsp?id=<%=oo.getId() %>">修改</A>
													</DIV>
												</TD>
												<TD width="13%">
													<DIV align=center>
														<A onclick="return ConfirmDel();"
															href="<%=request.getContextPath()%>/admin/j.do?use9=del&job.id=<%=oo.getId() %>">删除</A>
													</DIV>
												</TD>
											</TR>
											<%} %>
											<TR bgColor=#a4b6d7>
												<TD colSpan=7 height=25>
													<DIV align=right>
														全部-共2条招聘信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第1/1&nbsp;&nbsp;上一页&nbsp;&nbsp;下一页&nbsp;转到第
														<SELECT
															onchange=javascript:location=this.options[this.selectedIndex].value;
															name=sel_page>
															<OPTION value=Admin_HrDemand.asp?page=1&amp;id= selected>
																1
															</OPTION>
														</SELECT>
														页
													</DIV>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</DIV>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				<BR>
				<BR>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>