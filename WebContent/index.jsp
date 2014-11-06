<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.model.USE9"%>
<HTML>
	<HEAD>
		<TITLE>RDS</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<LINK href="files/use9.css" type=text/css rel=stylesheet>
		
	<SCRIPT type=text/javascript>
        function loginUser()
        {
            var name=document.getElementById("txtName").value;
            var pwd=document.getElementById("txtPwd").value;
            if(name=="")
            {
                document.getElementById("txtName").focus();
                alert("用户名不能为空");
                return false;
            } else 
            if(pwd=="")
            {
                document.getElementById("txtPwd").focus();
                alert("密码不能为空");
                return false;
            } else {
            	return true;
            }
 	</SCRIPT>

	<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
	</HEAD>
	<BODY>
		<FORM id=Form1 name=Form1 action="<%=request.getContextPath() %>/lo.do?use9=ck" method=post>
			<DIV>
			</DIV>

			<DIV
				style="WIDTH: 100%; PADDING-TOP: 120px; HEIGHT: 100%; TEXT-ALIGN: center">
				<TABLE cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
						<TR>
							<TD
								style="BACKGROUND-IMAGE: url(files/getImage62_r1_c1.jpg); WIDTH: 672px; HEIGHT: 136px"
								colSpan=3></TD>
						</TR>
						<TR>
							<TD
								style="BACKGROUND-IMAGE: url(files/getImage62_r2_c1.jpg); WIDTH: 440px; HEIGHT: 106px"></TD>
							<TD
								style="BACKGROUND-IMAGE: url(files/getImage62_r2_c2.jpg); WIDTH: 184px; HEIGHT: 106px">
								<TABLE style="HEIGHT: 100%" cellSpacing=0 cellPadding=0
									align=center border=0>
									<TBODY>
										<TR>
											<TD style="WIDTH: 571px">
												用户名
											</TD>
											<TD style="WIDTH: 464px">
												<INPUT class=txtInputStyle id=txtName
													style="FONT-SIZE: 11px; WIDTH: 119px; COLOR: dimgray; PADDING-TOP: 3px; FONT-FAMILY: Verdana; HEIGHT: 20px"
													onfocus=this.select() name=admin.loginName>
											</TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 15px"></TD>
											<TD style="HEIGHT: 15px"></TD>
										</TR>
										<TR>
											<TD style="WIDTH: 571px">
												密码
											</TD>
											<TD style="WIDTH: 464px">
												<INPUT class=txtInputStyle
													onkeypress=if(event.keyCode==13){loginUser();} id=txtPwd
													style="FONT-SIZE: 11px; WIDTH: 119px; COLOR: dimgray; PADDING-TOP: 3px; FONT-FAMILY: Verdana; HEIGHT: 20px"
													onfocus=this.select() type=password name=admin.loginPwd>
											</TD>
										</TR>
										<TR>
											<TD style="WIDTH: 571px; HEIGHT: 20px"></TD>
											<TD ></TD>
										</TR>
										<TR>
											<TD style="PADDING-LEFT: 50px; HEIGHT: 20px" align=left
												colSpan=2>
												<INPUT
													style="FONT-SIZE: 12px; BACKGROUND-IMAGE: url(files/denglu.gif); WIDTH: 58px; CURSOR: hand; BORDER-TOP-STYLE: none; FONT-FAMILY: 宋体; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 20px; BACKGROUND-COLOR: transparent; TEXT-DECORATION: none; BORDER-BOTTOM-STYLE: none"
													onclick="return loginUser();" type=submit value="登 录">
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
							<TD
								style="BACKGROUND-IMAGE: url(files/getImage62_r2_c3.jpg); WIDTH: 48px; HEIGHT: 106px"></TD>
						</TR>
						<TR>
							<TD
								style="BACKGROUND-IMAGE: url(files/getImage62_r3_c1.jpg); WIDTH: 672px; HEIGHT: 171px"
								colSpan=3></TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			<DIV></DIV>
		</FORM>
	</BODY>
</HTML>
