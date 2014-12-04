<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.model.*"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content=text/html;charset=gb2312>
		<LINK href="../files/use9.css" type=text/css rel=stylesheet>
		<STYLE type=text/css>
BODY {
	BACKGROUND: #799ae1;
	MARGIN: 0px
}

.sec_menu {
	BORDER-RIGHT: white 1px solid;
	BACKGROUND: #d6dff7;
	OVERFLOW: hidden;
	BORDER-LEFT: white 1px solid;
	BORDER-BOTTOM: white 1px solid
}

.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 10px;
	COLOR: #215dc6;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 10px;
	COLOR: #428eff;
	POSITION: relative;
	TOP: 2px
}
</STYLE>
		<SCRIPT>
	function aa(Dir) {
		tt.doScroll(Dir);
		Timer = setTimeout('aa("' + Dir + '")', 100)
	}//这里100为滚动速度
	function StopScroll() {
		if (Timer != null)
			clearTimeout(Timer)
	}

	function initIt() {
		divColl = document.all.tags("DIV");
		for (i = 0; i < divColl.length; i++) {
			whichEl = divColl(i);
			if (whichEl.className == "child")
				whichEl.style.display = "none";
		}
	}
	function expands(el) {
		whichEl1 = eval(el + "Child");
		if (whichEl1.style.display == "none") {
			initIt();
			whichEl1.style.display = "block";
		} else {
			whichEl1.style.display = "none";
		}
	}
	var tree = 0;
	function loadThreadFollow() {
		if (tree == 0) {
			document.frames["hiddenframe"].location
					.replace("Use9_LeftTree.jsp");
			tree = 1
		}
	}

	function showsubmenu(sid) {
		whichEl = eval("submenu" + sid);
		imgmenu = eval("imgmenu" + sid);
		if (whichEl.style.display == "none") {
			eval("submenu" + sid + ".style.display=\"\";");
			imgmenu.background = "../files/menuup.gif";
		} else {
			eval("submenu" + sid + ".style.display=\"none\";");
			imgmenu.background = "../files/menudown.gif";
		}
	}

	function loadingmenu(id) {
		var loadmenu = eval("menu" + id);
		if (loadmenu.innerText == "Loading...") {
			document.frames["hiddenframe"].location
					.replace("LeftTree.asp?menu=menu&id=" + id + "");
		}
	}
	top.document.title = "<%=USE9.web_name%>";
</SCRIPT>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
	</HEAD>
	<BODY>
		<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
			<TBODY>
				<TR>
					<TD vAlign=bottom height=42>
						<IMG height=38 src="../files/title.gif" width=158 border=0>
					</TD>
				</TR>
				<TR>
					<TD class=menu_title onmouseover=
	this.className = 'menu_title2';;
onmouseout=
	this.className = 'menu_title';;
background=../files/title_bg_quit.gif height=25>
						<SPAN><A href="<%=request.getContextPath()%>/index.jsp" target=_top><FONT
								color=#215dc6><B>退出 
							</FONT> </A> </SPAN></B>
					</TD>
				</TR>
				<TR>
					<TD>
						&nbsp;
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<SCRIPT>
	var he = document.body.clientHeight - 105
	document.write("<div id=tt style=height:" + he + ";overflow:hidden>")
</SCRIPT>

		<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
			<TBODY>
				<TR>
					<TD class=menu_title id=imgmenu1 onmouseover=
	this.className;
= 'menu_title2';;
style="CURSOR: hand" onclick=
	showsubmenu(1);;
onmouseout=
	this.className;
= 'menu_title';;
background=../files/menudown.gif height=25>
						<SPAN>系统管理 </SPAN>
					</TD>
				</TR>
				<TR>
					<TD id=submenu1 style="DISPLAY: none">
						<DIV class=sec_menu style="WIDTH: 158px">
							<TABLE cellSpacing=3 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD>
											<A href="../Use9_Admin.jsp" target=main>管理员管理</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<BR>
					</TD>
				</TR>
				<TR>
					<TD class=menu_title id=imgmenu2 onmouseover=
	this.className;
= 'menu_title2';;
style="CURSOR: hand" onclick=
	showsubmenu(2);;
onmouseout=
	this.className;
= 'menu_title';;
background=../files/menudown.gif height=25>
						<SPAN>数据上传 </SPAN>
					</TD>
				</TR>
				<TR>
					<TD id=submenu2 style="DISPLAY: none">
						<DIV class=sec_menu style="WIDTH: 158px">
							<TABLE cellSpacing=3 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD>
											<A href="../kcb.jsp?id=4" target=main>库存上传</A>
										</TD>
									</TR>
									<TR>
										<TD>
											<A href="../sp.jsp?id=1" target=main>商品档案上传</A>
										</TD>
									</TR>
									<TR>
										<TD>
											<A href="../gwl.jsp?id=11" target=main>改快递上传</A>
										</TD>
									</TR>
									<TR>
										<TD>
											<A href="../gbj.jsp?id=9" target=main><FONT color=#000000>改标签上传</FONT>
											</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<BR>
					</TD>
				</TR>
				<TR>
					<TD class=menu_title id=imgmenu3 onmouseover=
	this.className;
= 'menu_title2';;
style="CURSOR: hand" onclick=
	showsubmenu(3);;
onmouseout=
	this.className;
= 'menu_title';;
background=../files/menudown.gif height=25>
						<SPAN>数据下载</SPAN>
					</TD>
				</TR>
				<TR>
					<TD id=submenu3 style="DISPLAY: none">
						<DIV class=sec_menu style="WIDTH: 158px">
							<TABLE cellSpacing=3 cellPadding=0 width=130 align=center>
								<TBODY>
									<TR>
										<TD>
											<A href="../trade_list.jsp?id=6" target=main><FONT
												color=#000000>订单信息下载</FONT> </A>
										</TD>
									</TR>
									<TR>
										<TD>
											<A href="../ystrade_list.jsp?id=14" target=main><FONT
												color=#000000>原始订单信息下载</FONT> </A>
										</TD>
									</TR>
									<TR>
										<TD>
											<A href="../dygx.jsp?id=16" target=main><FONT color=#000000>货品下载</FONT>
											</A>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</DIV>
						<BR>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>
