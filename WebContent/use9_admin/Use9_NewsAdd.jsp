<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=myform action="<%=request.getContextPath()%>/admin/n.do?use9=save" method=post target=_self enctype="multipart/form-data">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top align=center>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width="95%"
						border=0>

						<TBODY>
							<TR>
								<TD class=back_southidc align=center colSpan=2 height=30>
									增加新闻
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD width=119 height=25>
									<FONT color=#ff0000>*</FONT>新闻标题：
								</TD>
								<TD width=476>
									<INPUT class=input maxLength=200 size=50 name=news.title>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>新闻类别：
								</TD>
								<TD>
									<SELECT name="logbean.mark">
										<%
										Use9NewtypeDAO dao = new Use9NewtypeDAO();
												List list = dao.findAll();
												for (Object aa : list) {
													Use9Newtype oo = (Use9Newtype) aa; %>
										<OPTION value="<%=oo.getId() %>" selected>
											<%=oo.getName() %>
										</OPTION>
										<%} %>
									</SELECT>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD vAlign=top height=25>
									<FONT color=#ff0000>*</FONT>新闻内容：
								</TD>
								<TD vAlign=top>
									<input type="hidden" id="content" name="news.content"/>
									<IFRAME id="eWebEditor"
										src="<%=request.getContextPath()%>/use9_admin/eWebEditor/ewebeditor.htm?id=content&style=coolblue"
										frameBorder=1 width=620 scrolling=no height=405></IFRAME>
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
									<INPUT class=input size=30 value=admin name=user>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									是否推荐：
								</TD>
								<TD>
									<INPUT type=radio value="1" name=ok size=30>&nbsp;&nbsp;
									<INPUT type=radio value="0" name=ok size=30 checked>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									推荐指数：
								</TD>
								<TD>
									<INPUT type=text value="" name=ok size=30>
									
									<FONT color=#ff0000>（0-500之间的整数！）</FONT>
								</TD>
							</TR>
							<TR>
								<TD align=center bgColor=#ecf5ff height=30>
									<DIV align=left>
										录入时间：
									</DIV>
								</TD>
								<TD align=center bgColor=#ecf5ff height=30>
									<DIV align=left>
										<INPUT id=AddDate maxLength=50 value="2009-6-1 11:23:02"
											name=AddDate>
									</DIV>
								</TD>
							</TR>
							<TR>
								<TD align=center bgColor=#ecf5ff colSpan=2 height=30>
									<INPUT class="input" type="submit" value=提交 name="Submit" onclick="content.value=eWebEditor.getHTML()">
									<INPUT class="input" type="reset" value=重置 name="Submit">
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
