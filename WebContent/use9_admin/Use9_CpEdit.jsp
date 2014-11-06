<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<%@ page import="com.use9.log.tools.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9ProductDAO dao = new Use9ProductDAO();
	Use9Product oo = dao.findById(id);
	String str = oo.getContent();
%>
<body onload="eWebEditor.setHTML('<%=Tools.toHtml(str) %>')">
	<FORM name=myform onsubmit="return CheckForm();"
		action="<%=request.getContextPath()%>/admin/p.do?use9=update"
		method="post" enctype="multipart/form-data">
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
					<TD vAlign=top align=center>
						<TABLE class=table_southidc cellSpacing=1 cellPadding=2
							width="95%" border=0>

							<TBODY>
								<TR>
									<TD class=back_southidc align=center colSpan=2 height=30>
										修改产品
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD width=119 height=25>
										<FONT color=#ff0000>*</FONT>产品名称：
									</TD>
									<TD width=476>
										<INPUT type="hidden" name="product.id"
											value="<%=oo.getId() %>">
										<INPUT class="input" maxLength="200" size="50"
											name="product.name" value="<%=oo.getName() %>">
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										<FONT color=#ff0000>*</FONT>所属类别：
									</TD>
									<TD>
										<SELECT name=logbean.mark>
											<%
										Use9ProducttypeDAO daot = new Use9ProducttypeDAO();
												List list1 = daot.findAll();
												for (Object aa : list1) {
													Use9Producttype oot = (Use9Producttype) aa; 
										%>
											<OPTION value="<%=oot.getId() %>" <%if((oo.getUse9Producttype()).getId() == oot.getId()) out.print("selected");%>>
												<%=oot.getName() %>
											</OPTION>
											<%} %>
										</SELECT>
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										<FONT color=#ff0000>*</FONT>产品型号：
									</TD>
									<TD>
										<input type="text" value="<%=oo.getXinghao() %>"
											name="product.xinghao">
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										<FONT color=#ff0000>*</FONT>产品原价：
									</TD>
									<TD>
										<input type="text" value="<%=oo.getCharge() %>"
											name="product.charge">
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										<FONT color=#ff0000>*</FONT>产品优惠价：
									</TD>
									<TD>
										<input type="text" value="<%=oo.getDiscount() %>"
											name="product.discount">
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD vAlign=top height=25>
										<FONT color=#ff0000>*</FONT>产品详情：
									</TD>
									<TD vAlign=top>
										<input type="hidden" id="content" name="product.content" />
										<IFRAME id=eWebEditor
											src="<%=request.getContextPath()%>/use9_admin/eWebEditor/ewebeditor.htm?id=content&style=coolblue"
											frameBorder=1 width=620 scrolling=no height=405></IFRAME>
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										大图片：
									</TD>
									<TD>
										<% if(null!=oo.getPic()){ %>
										<INPUT type="text" size="30" name="product.pic"
											value="<%=oo.getPic() %>">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onmousemove="show(this.tips,1,'<%=request.getContextPath()+USE9.cpimg+oo.getPic() %>')"
											onmouseout="show(this.tips,0)">图片预览</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="./admin/p.do?product.id=<%=oo.getId() %>&use9=update1" onclick="return ImgReup();">重新上传</a>
										<%}else{ %>
										<INPUT type="file" size="30" name="logbean.file">
										<%} %>
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										小图片：
									</TD>
									<TD>
										<% if(null!=oo.getSmallPic() ){ %>
										<INPUT type="text" size="30" name="product.smallPic"
											value="<%=oo.getSmallPic() %>">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onmousemove="show(this.tips,1,'<%=request.getContextPath()+USE9.cpimg+oo.getSmallPic() %>')"
											onmouseout="show(this.tips,0)">图片预览</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="../admin/p.do?product.id=<%=oo.getId() %>&use9=update2" onclick="return ImgReup();">重新上传</a>
										<%}else{ %>
										<INPUT type="file" size="30" name="logbean.file1">
										<%} %>
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										产品数量：
									</TD>
									<TD>
										<INPUT class=input size=30 value="<%=oo.getHavenum() %>"
											name="product.havenum">
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										是否推荐：
									</TD>
									<TD>
										<INPUT type=radio value="是" name=ok size=30>
										&nbsp;&nbsp;
										<INPUT type=radio value="否" name=ok size=30 checked>
									</TD>
								</TR>
								<TR bgColor=#ecf5ff>
									<TD height=25>
										推荐指数：
									</TD>
									<TD>
										<INPUT type=text name=product.reco size=30
											value="<%=oo.getReco() %>">

										<FONT color=#ff0000>（0-500之间的整数！）</FONT>
									</TD>
								</TR>
								<TR>
									<TD align=center bgColor=#ecf5ff colSpan=2 height=30>
										<INPUT class=input type=submit value=提交 name=Submit
											onclick="content.value = eWebEditor.getHTML();">
										<INPUT class=input type=reset value=重置 name=Submit>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
	<div id=mytips
		style="position: absolute; width: 10; height: 16; border: 1 gray solid; font-size: 9pt; background-color: #ffffff; color: red; display: none; filter: progid :   DXImageTransform.Microsoft.Shadow (   color =   #999999, direction =   135, strength =   3 );">
		正在加载图片....
	</div>
</body>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>
