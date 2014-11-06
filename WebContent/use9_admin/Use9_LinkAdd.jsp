<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=myform onsubmit="return CheckForm();"
	action="<%=request.getContextPath()%>/admin/l.do?use9=save" method="post" enctype="multipart/form-data">
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
										<STRONG>添加友情连接 <BR> </STRONG>
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
														<input type="text" name="link.name">
													</TD>
												</TR>
												<TR bgColor=#ecf5ff>
													<TD bgColor=#ecf5ff height=22>
														<DIV align=center>
															公司网址
														</DIV>
													</TD>
													<TD width="73%">
														<input type="text" name="link.webSite">
													</TD>
												</TR>
												<TR bgColor=#ecf5ff>
													<TD align=center>	
														是否推荐到首页
													</TD>	
													<TD width="73%">
														是<input type="radio" value="1" name="link.mark">
														否<input type="radio" value="0" name="link.mark" checked>
													</TD>	
												</TR>
												<TR bgColor=#ecf5ff>							
													<TD align=center>
														公司LOGO
													</TD>
													<TD width="73%">
														<input type="file" name="logbean.file">
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
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>