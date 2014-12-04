<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<jsp:include page="task_common.jsp" flush="true" />
<FORM id=taskForm action="" method=post>
	货品ID <input name="period" type="text" id="hh" /><input name="valid"
		type="button" value="搜索" onClick="search()" />
</FORM>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script>
	
	//按货物编号检索
	function search() {
		var hh = $("#hh").val();
		$.ajax({
			url : 'dygx_deal.jsp', //后台处理程序			
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
			url : 'dygx_deal.jsp', //后台处理程序			
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
		$("#dygx_table tr").eq(0).nextAll().remove();
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
					tr += "<tr bgColor=" + bgColor + "><td>"
							+ array['id'] + "</td>" + "<td>"
							+ array['numIid'] + "</td>" + "<td>"
							+ array['title'] + "</td>" + "<td>"
							+ array['outerId'] + "</td>" + "<td>"
							+ array['skuIName'] + "</td>" 
							+"<td>"+ array['skuOuterID'] + "</td>" 
							+ "</tr>";
				});
		$("#dygx_table").append(tr);
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

</script>
<input type="hidden" id="task_id"
	value='<%=request.getParameter("id")%>'>
<TABLE class=table_southidc cellSpacing=1 cellPadding=2 width=1200
	border=0>
	<TBODY>
		<TR class=tr_southidc>

			<TD>
				<TABLE id="dygx_table" width="100%" align=center border=0 border=0>
					<TBODY>
						<TR bgColor=#a4b6d7>
							<TD width="5%" height=25>
								<DIV align=center>ID</DIV>
							</TD>
							<TD width="15%">
								<DIV align=center>平台货品ID</DIV>
							</TD>
							<TD width="20%">
								<DIV align=center>平台货品名称</DIV>
							</TD>
							<TD width="20%">
								<DIV align=center>平台货品编号</DIV>
							</TD>
							<TD width="20%">
								<DIV align=center>平台规格名称</DIV>
							</TD>
							<TD width="20%">
								<DIV align=center>平台规格编号</DIV>
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