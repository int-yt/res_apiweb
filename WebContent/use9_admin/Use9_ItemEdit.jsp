<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.log.tools.*"%>
<%@ page import="com.use9.frame.model.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9ObjectDAO dao = new Use9ObjectDAO();
	Use9Object oo = dao.findById(id);
	String str = oo.getIntroduce();
%>
<body onload="eWebEditor.setHTML('<%=Tools.toHtml(str) %>')">
<FORM name=myform onsubmit="return CheckForm();"
	action="<%=request.getContextPath()%>/admin/o.do?use9=update" method="post" enctype="multipart/form-data">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top align=center>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width="95%"
						border=0>
						<TBODY>
							<TR>
								<TD class=back_southidc align=center colSpan=2 height=30>
									增加服务项目
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD width=119 height=25>
									<FONT color=#ff0000>*</FONT>项目名称：
								</TD>
								<TD width=476>
								<INPUT type="hidden" name="object.id" value="<%=oo.getId() %>">
									<INPUT class="input" maxLength="200" size="50" name="object.name" value="<%=oo.getName() %>">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>项目类别：
								</TD>
								<TD>
									<SELECT name=logbean.mark>
									<%
										Use9ObjecttypeDAO daot = new Use9ObjecttypeDAO();
										List list1 = daot.findAll();
										for (Object aa : list1) {
											Use9Objecttype oot = (Use9Objecttype) aa; 
									%>
										<OPTION value="<%=oot.getId() %>" selected>
											<%=oot.getName() %>
										</OPTION>
										<%} %>
									</SELECT>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD vAlign=top height=25>
									<FONT color=#ff0000>*</FONT>项目说明：
								</TD>
								<TD vAlign=top>
									<input type="hidden" id="content" name="object.introduce"/>
									<IFRAME id="eWebEditor"
										src="<%=request.getContextPath()%>/use9_admin/eWebEditor/ewebeditor.htm?id=content&style=coolblue"
										frameBorder="1" width="620" scrolling="no" height="405"></IFRAME>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
									<TD height=25>
										相关图片：
									</TD>
									<TD>
										<% if(null!=oo.getPic() ){ %>
										<INPUT type="text" size="30" name="object.pic"
											value="<%=oo.getPic() %>">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onmousemove="show(this.tips,1,'<%=request.getContextPath()+USE9.itemimg+oo.getPic() %>')"
											onmouseout="show(this.tips,0)">图片预览</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="../admin/o.do?object.id=<%=oo.getId() %>&use9=update2" onclick="return ImgReup();">重新上传</a>
										<%}else{ %>
										<INPUT type="file" size="30" name="logbean.file">
										<%} %>
									</TD>
								</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
								发布人：
								</TD>
								<TD>
									<INPUT class="input" size="30" value="" name="">
								</TD>
							</TR>
							<TR>
								<TD align=center bgColor=#ecf5ff height=30>
									<DIV align=left>
										录入时间：
									</DIV>
								</TD>
								<TD align="center" bgColor="#ecf5ff" height="30">
									<DIV align=left>
										<INPUT id="AddDate" maxLength="50" value="<%=Tools.getDatetime() %>"
											name="AddDate">
									</DIV>
								</TD>
							</TR>
							<TR>
								<TD align="center" bgColor="#ecf5ff" colSpan="2" height="30">
									<INPUT class="input" type="submit" value="提交" name="Submit" onclick="content.value=eWebEditor.getHTML()">
									<INPUT class="input" type="reset" value="重置" name="Submit">
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