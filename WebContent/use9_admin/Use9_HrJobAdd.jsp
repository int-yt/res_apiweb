<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<FORM name=myform onsubmit="return CheckForm();"
	action="<%=request.getContextPath()%>/admin/j.do?use9=save" method=post target=_self>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> 
      <table width="650" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td height="25" class="back_southidc"> 
            <div align="center"><strong>发布招聘信息 <br>
              </strong></div></td>
        </tr>
        <tr> 
        
            <td><div align="center"> 
                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                  <tr bgcolor="#ECF5FF"> 
                    <td width="19%" height="25"> 
                      <div align="center">招聘对象:</div></td>
                    <td width="81%"> 
                      <input name="job.person" type="text" id="HrName" size="30" maxlength="30"></td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">招聘人数:</div></td>
                    <td> 
                      <input name="job.number" type="text" id="HrRequireNum" size="5" maxlength="30">
                      人</td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">工作地点:</div></td>
                    <td height="-4"> 
                      <input name="job.workWhere" type="text" id="HrAddress" size="50" maxlength="60"> 
                    </td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">工资待遇:</div></td>
                    <td height="-1" bgcolor="#ECF5FF"> 
                      <input name="job.pay" type="text" id="HrSalary" size="20" maxlength="50">
                    </td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">有效期限:</div></td>
                    <td height="0"> 
                      <input name="job.dayLimit" type="text" id="HrValidDate" size="5" maxlength="30">
                      天</td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">招聘要求:</div></td>
                    <td height="10"> 
                       <input type="hidden" id="content" name="job.jobRequire"> 
                       <iframe ID="eWebEditor1" src="<%=request.getContextPath() %>/use9_admin/eWebEditor/ewebeditor.htm?id=content&style=coolblue" frameborder="0" scrolling="no" width="550" HEIGHT="400"></iframe> </td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="25" colspan="2"> 
                      <div align="center"> 
                        <input type="submit" value="确定" onclick="content.value=eWebEditor1.getHTML()">
                        &nbsp; 
                        <input type="reset" value="取消">
                      </div></td>
                  </tr>
                </table>
              </div></td>
        </tr>
      </table>
      <br> <br> </td>
  </tr>
</table>
</form>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>