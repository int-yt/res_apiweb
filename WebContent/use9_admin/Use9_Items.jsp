<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<TABLE class=border cellSpacing=1 cellPadding=5 width=620
					align=center bgColor=#000000 border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc height=25>
								<DIV align=center>
									<STRONG>服 务 项 目 管 理</STRONG>
								</DIV>
							</TD>
						</TR>
						<TR class=title>
						<TD bgColor=#a4b6d7 height=25>
								<%
									Use9ObjecttypeDAO dao1 = new Use9ObjecttypeDAO();
									List list1 = dao1.findAll();
									out.print("<script>function CpShow(e){");
									out.print("document.getElementById('all').style.display='none';");
									for (Object aa : list1) {
										Use9Objecttype oo = (Use9Objecttype) aa;
										out.print("document.getElementById('" + oo.getId()+ "').style.display='none';");
									}
									out.print("document.getElementById(e).style.display='block';}</script>");
								%>
								|&nbsp;<a href="javascript:;" onclick="CpShow('all')">所有信息</a>
								<% 
									for (Object aa : list1) {
										Use9Objecttype oo = (Use9Objecttype) aa;
								%>
								&nbsp;|&nbsp;<A href="javascript:;" onclick="CpShow('<%=oo.getId()%>')"><%=oo.getName()%></A>
								<%
									}
								%>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				<FORM name=del onsubmit="return ConfirmDel();" action=News_Del.asp
					method=post>
					<TABLE cellSpacing=1 cellPadding=0 width=620 bgColor=#000000
						border=0>
						<TBODY>
							<TR>
								<TD class=back_southidc width=553 height=25>
									<DIV align=left>
										<A href="">&nbsp;服务项目管理</A>&gt;&gt; 项目列表
									</DIV>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					
					<TABLE class=border style="WORD-BREAK: break-all" cellSpacing=1
						cellPadding=0 width=620 bgColor=#000000 border=0>
						<TBODY>
							<TR class=title bgColor=#dfebf2 id="all">
								<td>
									<table  width=620 >
										<TR class=title bgColor=#a4b6d7>
											<TD align=center width=5% height=25>
												选中
											</TD>
											<TD align=center width=40% bgColor=#a4b6d7>
												项目名称
											</TD>
											<TD align=center width=10%>
												所属分类
											</TD>
											<TD align=center width=15%>
												图片
											</TD>
											<TD align=center width=20% colspan="2">
												操作
											</TD>
										</TR>
										<%
											if (request.getParameter(USE9.parm) != null) {
												USE9.curpage = Integer
														.parseInt(request.getParameter(USE9.parm));
											}
											Use9ObjectDAO dao = new Use9ObjectDAO();
											LogBean bean = dao.findAll(USE9.curpage, USE9.pageSize, USE9.href);
											List list = bean.getList();
											for (Object aa : list) {
												Use9Object oo = (Use9Object) aa;
										%>
										<tr bgColor=#ecf5ff>
											<TD align=center width=5% height=25>
												<INPUT id=chkOne type=checkbox value=checkbox name=chkOne>
											</TD>
											<TD align=center width=30%>
												<%=oo.getName()%>
											</TD>
											<TD align=center width=15%>
												<%=oo.getUse9Objecttype().getName()%>
											</TD>
											<TD align=center width=20%>
												<%=oo.getPic() %>
											</TD>	
											<TD align=center >
												<A href="<%=request.getContextPath()%>/use9_admin/Use9_ItemEdit.jsp?id=<%=oo.getId()%>">修改</A>
											</TD>
											<TD align=center >
												<A onclick="return ConfirmDel();" href="<%=request.getContextPath()%>/admin/o.do?use9=del&object.id=<%=oo.getId()%>">删除</A>
											</TD>
										</tr>
										<%
											}
										%>
									</table>
								</td>
							</TR>
							<%
								for (Object bb : list1) {
									Use9Objecttype oo1 = (Use9Objecttype) bb;
							%>
							<TR class=title bgColor=#dfebf2 id="<%=oo1.getId()%>"style="display: none;">
								<td>
									<table width=620 >
										<TR class=title bgColor=#a4b6d7>
											<TD align=center width=5% height=25>
												选中
											</TD>
											<TD align=center width=40% bgColor=#a4b6d7>
												项目名称
											</TD>
											<TD align=center width=10%>
												所属分类
											</TD>
											<TD align=center width=15%>
												图片
											</TD>
											<TD align=center width=20% colspan="2">
												操作
											</TD>
										</TR>
										<%
										if (request.getParameter(USE9.parm) != null) {
												USE9.curpage = Integer
														.parseInt(request.getParameter(USE9.parm));
											}
											Use9ObjectDAO dao2 = new Use9ObjectDAO();
											LogBean bean1 = dao2.findPart(USE9.curpage, USE9.pageSize, USE9.href, oo1
														.getId());
											List list2 = bean1.getList();
											for (Object aa : list2) {
												Use9Object oo = (Use9Object) aa;
										%>
										<tr bgColor=#ecf5ff>
											<TD align=center width=5% height=25>
												<INPUT id=chkOne type=checkbox value=checkbox name=chkOne>
											</TD>
											<TD align=center width=30%>
												<%=oo.getName()%>
											</TD>
											<TD align=center width=15%>
												<%=oo.getUse9Objecttype().getName()%>
											</TD>
											<TD align=center width=20%>
												<%=oo.getPic() %>
											</TD>	
											<TD align=center >
												<A href="<%=request.getContextPath()%>/use9_admin/Use9_ItemEdit.jsp?id=<%=oo.getId()%>">修改</A>
											</TD>
											<TD align=center >
												<A onclick="return ConfirmDel();" href="<%=request.getContextPath()%>/admin/o.do?use9=del&object.id=<%=oo.getId()%>">删除</A>
											</TD>
										</tr>
										<%
											}
										%>
									</table>
								</td>
							</TR>
							<%
								}
							%>
						</TBODY>
					</TABLE>
					<TABLE cellSpacing=0 cellPadding=0 width=620 border=0>
						<TBODY>
							<TR>
								<TD width=100 height=30>
									<INPUT id=chkAll onclick=CheckAll(this.form); type=checkbox
										value=checkbox name=chkAll>
									选中本页所有
								</TD>
								<TD align="left">
									<INPUT type=submit value=删除选定所有 name=submit>
								</TD>
								<TD>
									<%
										if (bean != null)
											out.print(bean.getStrPage());
									%>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</FORM>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>
