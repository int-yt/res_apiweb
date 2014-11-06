function show(tips,flag,url){
var my_tips=document.all.mytips;
if(flag){
     my_tips.style.display="";
     if (url!=null){my_tips.innerHTML="<img src='"+url+"' align=left >";}
     else{ my_tips.innerHTML=tips;}
     my_tips.style.left=event.screenX-100;
     my_tips.style.top=event.screenY-800;
    }
else 
   {
    my_tips.style.display="none";
    }
}

function showlogo(tips,flag,url){
	var my_tips=document.all.mytips;
	if(flag){
	     my_tips.style.display="";
	     if (url!=null){my_tips.innerHTML="<img src='"+url+"' align=left >";}
	     else{ my_tips.innerHTML=tips;}
	     my_tips.style.left=event.screenX-200;
	     my_tips.style.top=event.screenY-200;
	    }
	else 
	   {
	    my_tips.style.display="none";
	    }
	}

function form_onsubmit() {
	var name = document.getElementById("UserName").value;
	var pwd = document.getElementById("password").value;
	var repwd = document.getElementById("rePassword").value
	if(name == ""){
		alert("帐号不能为空！");
	}else if( pwd == "" ){
		alert("密码不能为空！");
	}else if( repwd == ""){
		alert("确认密码不能为空！");
	}else if (pwd != repwd) {
		alert("新密码和确认密码不一致！");
		document.getElementById("password").value = '';
		document.getElementById("rePassword").value = '';
	} else {
		use9_form.submit();
	}
}

function checkBig() {
	if (document.getElementById("UserName").value == "") {
		alert("名称不能为空！");
		return false;
	}else {
		use9_form.submit();
	}
}

function checkReMass() {
	if (document.getElementById("content").value == "") {
		alert("内容不能为空！");
		return false;
	}else {
		use9_form.submit();
	}
}

function ConfirmDel() {
	if (confirm("确定要删除此记录吗？"))
		return true;
	else
		return false;
}

function ConfirmDelBig()
{
   if(confirm("确定要删除此类吗？删除是不能恢复！"))
     return true;
   else
     return false;
}

function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }

function ImgReup()
{

if(confirm('您确认对所选内容进行操作吗？'))
{
   document.myform.action=".";
   return(true);
}
else
{
   return(false);
}
}