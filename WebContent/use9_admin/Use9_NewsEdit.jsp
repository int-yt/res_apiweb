<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<%@ page import="com.use9.frame.model.*"%>
<%@ page import="com.use9.log.tools.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9NewsDAO dao = new Use9NewsDAO();
	Use9News oo = dao.findById(id);
	String str = oo.getContent();
%>
<body onload="eWebEditor.setHTML('<%=Tools.toHtml(str) %>')">
<FORM name=myform action="<%=request.getContextPath()%>/admin/n.do?use9=update" method=post target=_self enctype="multipart/form-data">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top align=center>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width="95%"
						border=0>

						<TBODY>
							<TR>
								<TD class=back_southidc align=center colSpan=2 height=30>
									编辑新闻内容
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD width=119 height=25>
									<FONT color=#ff0000>*</FONT>新闻标题：
								</TD>
								<TD width=476>
								<INPUT value="<%=oo.getId() %>" name="news.id" type="hidden">
								<INPUT class=input maxLength=200 size=50 name=news.title value="<%=oo.getTitle() %>">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>新闻类别：
								</TD>
								<TD>
									<SELECT name="logbean.mark">
										<%
										Use9NewtypeDAO daot = new Use9NewtypeDAO();
												List list = daot.findAll();
												for (Object aa : list) {
													Use9Newtype oot = (Use9Newtype) aa; %>
										<OPTION value="<%=oot.getId() %>" selected>
											<%=oot.getName() %>
										</OPTION>
										<%} %>
									</SELECT>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD vAlign=top height=25>
									<FONT color=#ff0000>*</FONT>新闻内容：
								</TD>
								<TD vAlign=top><br><input type="hidden" id="content" name="news.content"/>
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
										<% if(null!=oo.getIndexPic() ){ %>
										<INPUT type="text" size="30" name="newst.indexPic"
											value="<%=oo.getIndexPic() %>">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onmousemove="show(this.tips,1,'<%=request.getContextPath()+USE9.newsimg+oo.getIndexPic() %>')"
											onmouseout="show(this.tips,0)">图片预览</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="../admin/n.do?news.id=<%=oo.getId() %>&use9=update2" onclick="return ImgReup();">重新上传</a>
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
									<INPUT class=input size=30 value=<%=oo.getAuthor() %> name=user >
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
									<INPUT type=text value="<%=oo.getReco() %>" name="news.reco" size=30>
									
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
										<INPUT maxLength=50 value="<%=oo.getTimes() %>" name="news.times">
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
<div id=mytips
	style="position: absolute; width: 10; height: 16; border: 1 gray solid; font-size: 9pt; background-color: #ffffff; color: red; display: none; filter: progid :   DXImageTransform.Microsoft.Shadow (   color =   #999999, direction =   135, strength =   3 );">
	正在加载图片....
</div>
</body>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>