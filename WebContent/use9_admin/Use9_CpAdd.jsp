<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=use9_form action="<%=request.getContextPath()%>/admin/p.do?use9=save" method="post" enctype="multipart/form-data">
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD vAlign=top align=center>
					<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width="95%"
						border=0>

						<TBODY>
							<TR>
								<TD class=back_southidc align=center colSpan=2 height=30>
									添加产品
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD width=119 height=25>
									<FONT color=#ff0000>*</FONT>产品名称：
								</TD>
								<TD width=476>
									<INPUT id="productName" class=input maxLength=200 size=50 name=product.name>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>所属类别：
								</TD>
								<TD>
									<SELECT name=logbean.mark>
										<%
										Use9ProducttypeDAO dao1 = new Use9ProducttypeDAO();
												List list1 = dao1.findAll();
												for (Object aa : list1) {
													Use9Producttype oo = (Use9Producttype) aa; 
										%>
										<OPTION value="<%=oo.getId() %>">
											<%=oo.getName() %>
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
									<input type="text" value="" name="product.xinghao">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>产品原价：
								</TD>
								<TD>
									<input id="productCharge" type="text" value="" name="product.charge">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									<FONT color=#ff0000>*</FONT>产品优惠价：
								</TD>
								<TD>
									<input type="text" value="" name="product.discount">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD vAlign=top height=25>
									<FONT color=#ff0000>*</FONT>产品详情：
								</TD>
								<TD vAlign=top>
									<input type="hidden" id="content" name="product.content"/>
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
									<INPUT type="file"  size="30" name="logbean.file">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									小图片：
								</TD>
								<TD>
									<INPUT type="file"  size="30" name="logbean.file1">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									产品数量：
								</TD>
								<TD>
									<INPUT class=input size=30 value=admin name="product.havenum">
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									是否推荐：
								</TD>
								<TD>
									<INPUT type=radio value="是" name=ok size=30>&nbsp;&nbsp;
									<INPUT type=radio value="否" name=ok size=30 checked>
								</TD>
							</TR>
							<TR bgColor=#ecf5ff>
								<TD height=25>
									推荐指数：
								</TD>
								<TD>
									<INPUT type=text name=product.reco size=30>
									
									<FONT color=#ff0000>（0-500之间的整数！）</FONT>
								</TD>
							</TR>
							<TR>
								<TD align=center bgColor=#ecf5ff colSpan=2 height=30>
									<INPUT class=input type=submit value=提交 name=Submit onclick="content.value=eWebEditor.getHTML()">
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
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>
