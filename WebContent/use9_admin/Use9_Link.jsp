<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<SCRIPT language=javascript>
function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("确定要删除选中的项目吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;	 
}
</SCRIPT>

<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<BR>
				<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=560
					border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc height=25>
								<DIV align=center>
									<STRONG>友情连接管理 <BR> </STRONG>
								</DIV>
							</TD>
						</TR>
						<TR>		
							<TD>
								<DIV align=center>
									<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
										<TBODY>
											<TR bgColor=#a4b6d7  height=25>
												<TD width="25%" >
													<DIV align=center>
														网站名称
													</DIV>
												</TD>
												<TD width="15%">
													<DIV align=center>
														网站LOGO
													</DIV>
												</TD>
												<TD width="30%">
													<DIV align=center>
														网站url
													</DIV>
												</TD>
												<TD width="10%">
													<DIV align=center>
														推荐	状态
													</DIV>
												</TD>
												<TD width="20%" colspan="2">
													<DIV align=center>
														操作
													</DIV>
												</TD>
											</TR>
											<%
												Use9LinkDAO dao = new Use9LinkDAO();
												List list = dao.findAll();
												for (Object aa : list) {
													Use9Link oo = (Use9Link) aa;
											%>
											<TR bgColor=#ecf5ff height="25" align=center>
												<TD width="25%">
													<%=oo.getName()%>
												</TD>
												<TD width="15%">

													<%
														if (null != oo.getPic()) {
													%>
													<a href="#" onmousemove="showlogo(this.tips,1,'<%=request.getContextPath() + USE9.logoimg + oo.getPic()%>')"
														onmouseout="showlogo(this.tips,0)">图片预览</a>
													<%
														}
													%>
												</TD>
												<TD width="30%">
													<%=oo.getWebSite()%>
												</TD>
												<TD width="10%">
													<%
														if (0 == oo.getMark()) {
																out.print("否");
															} else {
																out.println("是");
															}
													%>
												</TD>
												<TD>
													<A
														href="<%=request.getContextPath()%>/use9_admin/Use9_LinkEdit.jsp?id=<%=oo.getId()%>">修改</A>
												</TD>
												<TD>
													<A onclick="return ConfirmDel();"
														href="<%=request.getContextPath()%>/admin/l.do?use9=del&link.id=<%=oo.getId()%>">删除</A>
												</TD>

											</TR>
											<%
												}
											%>
											<TR bgColor=#a4b6d7>
												<TD colSpan=5 height=25>
													<DIV align=right>
														全部共6条荣誉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第1/1&nbsp;&nbsp;上一页&nbsp;&nbsp;下一页&nbsp;转到第
														<SELECT
															onchange=javascript:location=this.options[this.selectedIndex].value;
															name=sel_page>
															<OPTION value=Admin_Honor.asp?page=1&amp;id= selected>
																1
															</OPTION>
														</SELECT>
														页
													</DIV>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<DIV align=right></DIV>
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
<div id=mytips
	style="position: absolute; width: 10; height: 16; border: 1 gray solid; font-size: 9pt; background-color: #ffffff; color: red; display: none; filter: progid :     DXImageTransform.Microsoft.Shadow (     color =     #999999, direction =     135, strength =     3 );">
	正在加载图片....
</div>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>
