<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM action="" method=post>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD vAlign=top align=center>
				<BR>
				<TABLE cellSpacing=1 cellPadding=0 width=560 bgColor=#000000
					border=0>
					<TBODY>
						<TR>
							<TD class=back_southidc height=28>
								<DIV align=center>
									<STRONG>添加自动回复内容 <BR> </STRONG>
								</DIV>
							</TD>
						</TR>
						<TR class=tr_southidc>	
							<TD>
								<DIV align=center>
									<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
										<TBODY>
											<TR bgColor=#a4b6d7>
												<TD width="16%" height=25>
													<DIV align=center>
														标&nbsp;&nbsp;题
													</DIV>
												</TD>
												<TD width="45%">
													<INPUT maxLength=100 size=35 name=title>
												</TD>
											</TR>
											<TR>
												<TD height=22>
													<DIV align=center>
														内&nbsp;&nbsp;容
													</DIV>
												</TD>
												<TD colSpan=3>
													<TEXTAREA name=Content rows=8 cols=45></TEXTAREA>
												</TD>
											</TR>
											<TR bgColor=#a4b6d7>
												<TD colSpan=4 height=25>
													<DIV align=center>
														<INPUT type=submit value=提交内容 name=B1>
														<INPUT type=reset value=全部重写 name=B2>
													</DIV>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing=1 cellPadding=1 width="100%" bgColor=#000000
										border=0>
										<TBODY>
											<TR bgColor=#ecf5ff>
												<TD width="63%" bgColor=#ecf5ff height=25>
													<DIV align=center>
														回复内容
													</DIV>
													<DIV align=center></DIV>
												</TD>
												<TD width="18%">
													<DIV align=center>
														加入时间
													</DIV>
												</TD>
												<TD width="9%">
													<DIV align=center>
														操作
													</DIV>
												</TD>
												<TD width="10%">
													<DIV align=center>
														操作
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
				<BR>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</FORM>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>

