<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.model.*"%>
<HTML>
	<HEAD>
		<TITLE>后台管理页面</TITLE>
		<META http-equiv=Content-Type content=text/html;charset=gb2312>
		<STYLE type=text/css>
.navPoint {
	FONT-SIZE: 9pt;
	CURSOR: hand;
	COLOR: white;
	FONT-FAMILY: Webdings
}

.a2 {
	BACKGROUND-COLOR: #a4b6d7
}
</STYLE>

		<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
	</HEAD>
	<BODY>
		<SCRIPT>
	if (self != top) {
		top.location = self.location;
	}
	function switchSysBar() {
		if (switchPoint.innerText == 3) {
			switchPoint.innerText = 4
			document.all("frmTitle").style.display = "none"
		} else {
			switchPoint.innerText = 3
			document.all("frmTitle").style.display = ""
		}
	}
</SCRIPT>

		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
					<TD id=frmTitle vAlign=middle noWrap align=center>
						<IFRAME id=carnoc
							style="Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 170px; HEIGHT: 100%"
							name=carnoc src="inc/Use9_LeftTree.jsp" frameBorder=0
							scrolling=no>
						</IFRAME>
					</TD>
					<TD style="WIDTH: 9pt" bgColor=#a4b6d7>
						<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
							<TBODY>
								<TR>
									<TD style="HEIGHT: 100%" onclick="switchSysBar();">
										<FONT style="FONT-SIZE: 9pt; CURSOR: default; COLOR: #ffffff"><BR>
											<BR> <BR> <BR> <BR> <BR> <BR> <BR>
											<BR> <BR> <BR> <BR> <BR> <SPAN
											class=navPoint id=switchPoint title=关闭/打开左栏>3</SPAN> <BR>
											<BR> <BR> <BR> <BR> <BR> <BR> <BR>屏幕切换
										</FONT>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD style="WIDTH: 100%">
						<IFRAME id=main
							style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 7%"
							name=top src="inc/Use9_Top.jsp" frameBorder=0 scrolling=no>
						</IFRAME>
						<IFRAME id=main
							style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 96%"
							name=main src="Use9_Admin.jsp" frameBorder=0 scrolling=yes></IFRAME>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<SCRIPT>
	if (window.screen.width < '1024') {
		switchSysBar()
	}
</SCRIPT>
	</BODY>
</HTML>
