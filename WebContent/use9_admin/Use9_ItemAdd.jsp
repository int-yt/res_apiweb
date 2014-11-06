<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=myform onsubmit="return CheckForm();"
	action="<%=request.getContextPath()%>/admin/o.do?use9=save" method="post" enctype="multipart/form-data">
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
									<INPUT class=input maxLength=200 size=50 name="object.name">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>项目类别：
								</TD>
								<TD>
									<SELECT name=logbean.mark>
									<%
										Use9ObjecttypeDAO dao1 = new Use9ObjecttypeDAO();
										List list1 = dao1.findAll();
										for (Object aa : list1) {
											Use9Objecttype oo = (Use9Objecttype) aa; 
									%>
										<OPTION value="<%=oo.getId() %>" selected>
											<%=oo.getName() %>
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
									<INPUT type="file"  size="30" name="logbean.file">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
								发布人：
								</TD>
								<TD>
									<INPUT class="input" size="30" value="admin" name="">
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
										<INPUT id="AddDate" maxLength="50" value="2009-6-1 11:23:02"
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
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>
