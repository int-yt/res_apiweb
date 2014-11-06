<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	Use9VipDAO dao = new Use9VipDAO();
	Use9Vip oo = dao.findById(id);
%>
<body>
<FORM name=use9_form action="<%=request.getContextPath()%>/admin/v.do?use9=update" method=post>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> 
      <table width="650" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td height="25" class="back_southidc"> 
            <div align="center"><strong>注册会员信息 <br>
              </strong></div></td>
        </tr>
        <tr> 
            <td><div align="center"> 
                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                
                  <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">登陆名:</div></td>
                    <td> 
                      <input name="vip.loginName" type="text" maxlength="15" value="<%=oo.getLoginName() %>"></td>
                  </tr>
                  <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">登陆密码:</div></td>
                    <td> 
                      <input name="vip.loginPwd" type="text" maxlength="15" value="<%=oo.getLoginPwd() %>"> 
                    </td>
                  </tr>
                    <tr bgcolor="#ECF5FF" align="left"> 
                    <td width="20%" height="25"> 
                      <div align="left">用户名:</div></td>
                    <td width="80%"> 
                      <input name="vip.id" type="hidden" value="<%=oo.getId() %>">
                      <input name="vip.mark" type="hidden" value="<%=oo.getMark() %>">
                      <input name="vip.useName" type="text" size="20" maxlength="30" value="<%=oo.getUseName() %>"></td>
                  </tr>
                   <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">性别:</div></td>
                    <td height="10"> 
                	           男 <input type="radio" name="vip.sex" value="1" <%if(1 == oo.getSex()){out.print("checked");} %>> 
         			 	 女 <input type="radio" name="vip.sex" value="0" <%if(0 == oo.getSex()){out.print("checked");} %>>
                     </td>
                  </tr>
                  <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">验证问题:</div></td>
                    <td  bgcolor="#ECF5FF"> 
                      <input name="vip.question" type="text"  size="40" maxlength="20" value="<%=oo.getQuestion() %>">
                    </td>
                  </tr>
                  <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">问题答案:</div></td>
                    <td> 
                      <input name="vip.answer" type="text" size="40" maxlength="20" value="<%=oo.getAnswer() %>"></td>
                  </tr>
                   <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">邮箱:</div></td>
                    <td> 
                       <input type="text" id="content" name="vip.email" maxlength="20" value="<%=oo.getEmail() %>"> 
                     </td>
                  </tr>
                   <tr bgcolor="#ECF5FF" align="left"> 
                    <td height="22"> 
                      <div align="left">电话:</div></td>
                    <td > 
                       <input type="text" id="content" name="vip.tel" maxlength="15" value="<%=oo.getTel() %>"> 
                     </td>
                  </tr>
                   <tr bgcolor="#ECF5FF" align="left"> 
                    <td> 
                      <div align="left">主页:</div></td>
                    <td> 
                       <input type="text" id="content" name="vip.homepage" size="40" maxlength="40" value="<%=oo.getHomepage() %>"> 
                     </td>
                  </tr>
                  <tr bgcolor="#ECF5FF" align="center"> 
                    <td height="25" colspan="2"> 
                      <div align="center"> 
                        <input type="submit" value="确定">
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