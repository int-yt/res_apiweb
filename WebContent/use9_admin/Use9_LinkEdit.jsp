<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9LinkDAO dao = new Use9LinkDAO();
	Use9Link oo = dao.findById(id);
%>
<FORM name=myform onsubmit="return CheckForm();"
	action="<%=request.getContextPath()%>/admin/l.do?use9=update"
	method="post" enctype="multipart/form-data">
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
										<STRONG>修改友情连接 <BR> </STRONG>
									</DIV>
								</TD>
							</TR>
							<TR>
								<TD>
									<DIV align=center>
										<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
											<TBODY>
												<TR bgColor=#ecf5ff>
													<TD width="27%" height=25>
														<DIV align=center>
															公司名称
														</DIV>
													</TD>
													<TD width="73%">
														<input type="hidden" name="link.id"
															value="<%=oo.getId() %>">
														<input type="text" name="link.name"
															value="<%=oo.getName()%>">
													</TD>
												</TR>
												<TR bgColor=#ecf5ff>
													<TD bgColor=#ecf5ff height=22>
														<DIV align=center>
															公司网址
														</DIV>
													</TD>
													<TD width="73%">
														<input type="text" name="link.webSite"
															value="<%=oo.getWebSite()%>">
													</TD>
												</TR>
												<TR bgColor=#ecf5ff>
													<TD align=center>
														是否推荐到首页
													</TD>
													<TD width="73%">
														是
														<input type="radio" value="1" name="link.mark">
														否
														<input type="radio" value="0" name="link.mark" checked>
													</TD>
												</TR>
												<TR bgColor=#ecf5ff>
													<TD align=center>
														公司LOGO
													</TD>
													<TD width="73%">

														<%
															if (null != oo.getPic()) {
														%>
														<INPUT type="text" name="link.pic"
															value="<%=oo.getPic()%>">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<a href="#"
															onmousemove="showlogo(this.tips,1,'<%=request.getContextPath() + USE9.logoimg + oo.getPic()%>')"
															onmouseout="showlogo(this.tips,0)">图片预览</a>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<a
															href="../admin/l.do?link.id=<%=oo.getId()%>&use9=update2"
															onclick="return ImgReup();">重新上传</a>
														<%
															} else {
														%>
														<INPUT type="file" size="30" name="logbean.file">
														<%
															}
														%>
													</TD>
												</TR>
												<TR bgColor=#ecf5ff>
													<TD colSpan=2 height=25>
														<DIV align=center>
															<INPUT type=submit value=确定 name=submit>
															&nbsp;
															<INPUT type=reset value=取消 name=reset>
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
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</FORM>
<div id=mytips
	style="position: absolute; width: 10; height: 16; border: 1 gray solid; font-size: 9pt; background-color: #ffffff; color: red; display: none; filter: progid :     DXImageTransform.Microsoft.Shadow (     color =     #999999, direction =     135, strength =     3 );">
	正在加载图片....
</div>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>