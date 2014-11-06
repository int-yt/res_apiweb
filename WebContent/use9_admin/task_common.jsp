<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script>
	$(function() {
		var task_id = $("#task_id").val();
		$.ajax({
			url : 'task_common_deal.jsp', //后台处理程序			
			type : 'post', //数据发送方式
			data : {
				action : "query",
				id:task_id
			},
			dataType : 'json', //接受数据格式
			success : function(json) {
				if (json.task_type == 1) {
					$('input:radio[name="task_type"]').eq(1).attr("checked",
							true);
				} else {
					$('input:radio[name="task_type"]').eq(0).attr("checked",
							true);
				}
				if (json.valid == 1) {
					$('input:radio[name="valid"]').eq(1).attr("checked", true);
				} else {
					$('input:radio[name="valid"]').eq(0).attr("checked", true);
				}
				$("#start_time").val(json.start_time);
				$("#period").val(json.period);
			},
			error : function() {
				alert('查询任务信息失败');
			}
		});
	});

	function save() {
		var task_id = $("#task_id").val();
		var params = $('#taskForm').serialize() + "&action=save&id=" + task_id; //序列化表单的值	
		$.ajax({
			url : 'task_common_deal.jsp', //后台处理程序			
			type : 'post', //数据发送方式
			data : params, //要传递的数据	
			dataType : 'json', //接受数据格式
			success : function(json) {
				alert(json.result);
			},
			error : function() {
				alert('保存失败,请输入正确的时间&间隔');
			}
		});
	}
</script>
<FORM id=taskForm action="" method=post>
	<table>
		<tr>
			<td><input name="valid" type="radio" value="1" />开启任务 <input
				name="valid" type="radio" value="0" />关闭任务</td>
			<td><input name="task_type" type="radio" value="0" />每日一次 <input
				name="start_time" type="text" id="start_time" /></td>
			<td><input name="task_type" type="radio" value="1" />间隔 <input
				name="period" type="text" id="period" />分钟</td>
			<td><input name="valid" type="button" value="保存"
				onClick="save()" /></td>
		</tr>
	</table>
</FORM>
