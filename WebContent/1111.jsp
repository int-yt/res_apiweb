<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>奋战双11</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<style type="text/css">
html {
	text-align: center;
}
</style>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script>
function save() {
	var params=$('#outForm').serialize(); //序列化表单的值
	$('#save1').attr('disabled','disabled');
	 $.ajax({
		url : '1111_deal.jsp', //后台处理程序			
		type : 'post', //数据发送方式
		data : params,
		dataType : 'json', //接受数据格式
		success : function(json) {
			alert(json.msg);
			$("input[type=reset]").trigger("click");
		}, 
		error : function() {
			alert('登记入库失败');
		},
		complete : function() { 
			$('#save1').removeAttr("disabled");
		} 
	}); 
}
</script>
</HEAD>
<body>
	双十一批量出仓登记系统
	<form id="outForm">
		<table style="margin:0 auto;">
			<tr>
				<td colspan="3"><TEXTAREA name="expressOutId" cols="60"
						rows="30"></TEXTAREA></td>
			</tr>
			<tr>
			<td><input type="text" name="userId" value="请输入工号" onfocus="if(this.value=='请输入工号')this.value=''" onblur="if(this.value=='')this.value='请输入工号'"></td>
			<td><input type="text" name="itemWeight" value="请输入重量" onfocus="if(this.value=='请输入重量')this.value=''" onblur="if(this.value=='')this.value='请输入重量'"></td>
			<td><input id="save1" type="button" value="登记出仓" onClick="save()"></td>
			<input  type="reset" style="display:none;" /> 
			</tr>
		</table>
	</form>
</body>
</HTML>