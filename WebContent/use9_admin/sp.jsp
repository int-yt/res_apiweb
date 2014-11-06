<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<jsp:include page="task_common.jsp" flush="true" />
<FORM id=taskForm action="" method=post>
	货号 <input name="period" type="text" id="hh" /><input name="valid"
		type="button" value="搜索" onClick="search()" /><input name="valid"
		type="button" value="提交失败" onClick="modifyAll()" />
</FORM>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script>
	
	//按货物编号检索
	function search() {
		var hh = $("#hh").val();
		$.ajax({
			url : 'sp_deal.jsp', //后台处理程序			
			type : 'post', //数据发送方式
			data : {
				action : "search",
				hh : hh,
			},
			dataType : 'json', //接受数据格式
			success  : showResult,
			error : function() {
				alert('查询货号失败');
			}			
		});
	}

	//重新提交所有失败
	function modifyAll() {
		$.ajax({
			url : 'sp_deal.jsp', //后台处理程序			
			type : 'post', //数据发送方式
			data : {
				action : "modifyAll",
			},
			success : function() {
				query(1);
			},
			error : function() {
				alert('更新状态失败');
			}			
		});
	}
	
	$(function() {
		//页面初次加载
		query(1);
		$("body").on("click", "#pagecount span a", function() {
			var rel = $(this).attr("rel");
			if (rel) {
				query(rel);
			}

		});

	});
	
	//查询某页明细
	function query(pageNum) {
		var taskId = $("#task_id").val();
		page = pageNum;
		$.ajax({
			url : 'sp_deal.jsp', //后台处理程序			
			type : 'post', //数据发送方式
			data : {
				action : "query",
				id : taskId,
				pageNum : pageNum
			},
			dataType : 'json', //接受数据格式
			success : showResult,
			error : function() {
				alert('查询执行明细失败');
			},
			complete : function() { //生成分页条 
				getPageBar();
			}
		});
	}
	
	//显示明细
	function showResult(json) {
		//清空显示数据
		$("#sp_table tr").eq(0).nextAll().remove();
		$("#pagecount").empty();

		var list = json.list;
		var tr = "";
		pageSize = json.pageSize; //每页显示条数  
		curPage = page; //当前页		 
		totalPage = json.totalPage; //总页数
		
		$.each(
				list,
				function(index, array) { //遍历json数据列  
					if (index % 2 == 0) {
						bgColor = 'white';
					} else {
						bgColor = '#f1f5f8';
					}
					var apiTimeJson = array['apiTime'];
					var updateTimeJson = array['updateTime'];
					var apiTime = "";
					var updateTime = "";
					if (apiTimeJson != null) {
						var real_time = new Date(apiTimeJson.time)
						apiTime = real_time
								.format('yyyy-MM-dd hh:mm:ss');
					}
					if (updateTimeJson != null) {
						var real_time = new Date(updateTimeJson.time)
						updateTime = real_time
								.format('yyyy-MM-dd hh:mm:ss');
					}
					if (array['zt'] == 1) {
						zt = "已提交";
					} else {
						zt = "未提交";
					}
					if (array['zt'] == 1 && array['hk'] != 0) {
						btnStatus = "<button class='btnStatus' type='button' >重新提交</button>";
					} else {
						//上传失败
						btnStatus = "<button class='btnStatus' type='button' disabled='disabled'>重新提交</button>";
					}
					tr += "<tr bgColor=" + bgColor + "><td>"
							+ array['id'] + "</td>" + "<td>"
							+ array['hh'] + "</td>" + "<td>"
							+ array['mc'] + "</td>" + "<td>"
							+ array['zl'] + "</td>" + "<td>"
							+ array['je'] + "</td>" + "<td>"
							+ array['tm'] + "</td>" + "<td>"
							+ updateTime + "</td>" + "<td>" + zt
							+ "</td>" + "<td>" + apiTime + "</td>"
							+ "<td>" + array['hk'] + "</td>" + "<td>"
							+ array['hkmsg'] + "</td>" + "<td>"
							+ btnStatus + "</td></tr>";
				});
		$("#sp_table").append(tr);
	}

	//获取分页条 
	function getPageBar() {
		//页码大于最大页数 
		if (curPage > totalPage)
			curPage = totalPage;
		//页码小于1 
		if (curPage < 1)
			curPage = 1;
		pageStr = "<span>共" + totalPage + "页</span><span>(" + curPage + "/"
				+ totalPage + ")</span>";
		//如果是第一页   
		if (curPage == 1) {
			pageStr += "<span>首页</span><span>上一页</span>";
		} else {
			pageStr += "<span><a href='#' rel='1'>首页</a></span><span><a href='#' rel='"
					+ (curPage - 1) + "'>上一页</a></span>";
		}
		//如果是最后页   
		if (curPage >= totalPage) {
			pageStr += "<span>下一页</span><span>尾页</span>";
		} else {
			pageStr += "<span><a href='#'  rel='"
					+ (parseInt(curPage) + 1)
					+ "'>下一页</a></span><span><a href='#' rel='"+totalPage+"'>尾页</a></span>";

		}

		$("#pagecount").html(pageStr);

	}
	Date.prototype.format = function(format) {
		var date = {
			"M+" : this.getMonth() + 1,
			"d+" : this.getDate(),
			"h+" : this.getHours(),
			"m+" : this.getMinutes(),
			"s+" : this.getSeconds(),
			"q+" : Math.floor((this.getMonth() + 3) / 3),
			"S+" : this.getMilliseconds()
		};
		if (/(y+)/i.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear() + '')
					.substr(4 - RegExp.$1.length));
		}
		for ( var k in date) {
			if (new RegExp("(" + k + ")").test(format)) {
				format = format.replace(RegExp.$1,
						RegExp.$1.length == 1 ? date[k] : ("00" + date[k])
								.substr(("" + date[k]).length));
			}
		}
		return format;
	}

	//重新提交
	$("body").on("click", ".btnStatus", function() {
		var curTr = $(this).parent().parent();
		var id = curTr.find("td").eq(0).text();
		$.ajax({
			url : 'sp_deal.jsp', //后台处理程序			
			type : 'post', //数据发送方式
			data : {
				action : "modify",
				id : id
			},
			dataType : 'json', //接受数据格式
			success : function(json) {
				alert(json.code);
				if (json.code == 0) {
					curTr.find("td").eq(7).text("未提交");
					curTr.find("td").eq(6).text(json.update_time);
					curTr.find("td").eq(11).find("button").attr('disabled','disabled');
				} else {
					alert('修改状态失败');
				}
			},
			error : function() {
				alert('修改提交状态失败');
			}
		});
	});
</script>
<input type="hidden" id="task_id"
	value='<%=request.getParameter("id")%>'>
<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=1200
	border=0>
	<TBODY>
		<TR class=tr_southidc>

			<TD>
				<TABLE id="sp_table" width="100%" align=center border=0 border=0>
					<TBODY>
						<TR bgColor=#a4b6d7>
							<TD width="5%" height=25>
								<DIV align=center>ID</DIV>
							</TD>
							<TD width="7%">
								<DIV align=center>货号</DIV>
							</TD>
							<TD width="7%">
								<DIV align=center>商品名称</DIV>
							</TD>
							<TD width="7%">
								<DIV align=center>重量</DIV>
							</TD>
							<TD width="7%">
								<DIV align=center>金额</DIV>
							</TD>
							<TD width="7%">
								<DIV align=center>条码</DIV>
							</TD>
							<TD width="10%">
								<DIV align=center>插入时间</DIV>
							</TD>
							<TD width="10%">
								<DIV align=center>状态</DIV>
							</TD>
							<TD width="10%">
								<DIV align=center>提交API时间</DIV>
							</TD>
							<TD width="5%">
								<DIV align=center>返回值</DIV>
							</TD>
							<TD width="8%">
								<DIV align=center>返回信息</DIV>
							</TD>
							<TD width="10%">
								<DIV align=center>操作</DIV>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>

		</TR>
	</TBODY>
</TABLE>
<div id="pagecount"></div>
<BR>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>