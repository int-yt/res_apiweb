<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.use9.frame.hibernate.pojo.*"%>
<%@ page import="com.use9.frame.hibernate.dao.*"%>
<jsp:include page="inc/Use9_Head.jsp"></jsp:include>
<%
	Use9ConfigDAO dao = new Use9ConfigDAO();
	Use9Config  conf = (Use9Config)dao.findAll().get(0);
%>
<form method="POST" action="<%=request.getContextPath()%>/admin/conf.do?use9=update" id="form" name="form">
  <table width="650" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000" >
    <tr> 
      <td height="24" colspan="4" class="back_southidc"> <div align="center"><strong>网 
          站 配 置</strong></div></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td colspan="4" > <strong>网站信息配置</strong></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>网站名称：</strong></td>
      <td colspan="3"> 
      <input name="config.webName" type="text" id="SiteName" value="<%=conf.getWebName() %>" size="40" maxlength="50">
      <input name="config.id" type="hidden" value="<%=conf.getId() %>"> 
      </td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td><strong>网站名称(英文)：</strong></td>
      <td colspan="3"><input name="config.webEname" type="text" id="EnSiteName" value="<%=conf.getWebEname() %>" size="40" maxlength="50"></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>网站标题：</strong></td>
      <td colspan="3"> <input name="config.webTile" type="text" id="SiteTitle" value="<%=conf.getWebTile() %>" size="40" maxlength="50"> 
      </td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td><strong>网站标题(英文)：</strong></td>
      <td colspan="3"><input name="config.webEtile" type="text" id="EnSiteTitle" value="<%=conf.getWebEtile() %>" size="40" maxlength="50"></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>网站地址：</strong><br>
        请添写完整URL地址(用于网站统计)</td>
      <td colspan="3"> <input name="config.webLink" type="text" id="SiteUrl" value="<%=conf.getWebLink() %>" size="40" maxlength="255"> 
      </td>
    </tr>
  
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>LOGO地址：</strong><br> </td>
      <td colspan="3"> <input name="config.webLogo" type="text" id="LogoUrl" value="<%=conf.getWebLogo() %>" size="40" maxlength="255"> 
      </td>
    </tr>
 
    <tr bgcolor="#ecf5ff"> 
      <td><strong>首页Banner地址：</strong><br>
        图片格式为：jpg,gif,bmp,png,swf <strong>(英文版)：</strong></td>
      <td colspan="3"><input name="config.webBanner" type="text" id="EnBannerUrl" value="<%=conf.getWebBanner() %>" size="25" maxlength="255"></td>
    </tr>
   
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>站长姓名：</strong></td>
      <td colspan="3"> <input name="config.webOwner" type="text" id="WebmasterName" value="<%=conf.getWebOwner() %>" size="40" maxlength="20"> 
      </td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>站长QQ：</strong></td>
      <td colspan="3"> <input name="config.webQq" type="text" id="WebmasterEmail" value="<%=conf.getWebQq() %>" size="40" maxlength="100"> 
      </td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td width="224"><strong>站长信箱：</strong></td>
      <td colspan="3"> <input name="config.webEmail" type="text" id="WebmasterEmail" value="<%=conf.getWebEmail() %>" size="40" maxlength="100"> 
      </td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td><p><strong>版权信息：</strong><br>
          <span style="color: #FF0000">支持HTML标记，不能使用双引号</span></p>
        <p style="color: #FF0000">不支持Enter换行，如前台需要显示换行，请在需要换行的文字前加 <span style="color: #000000">&lt;br&gt;</span></p></td>
      <td colspan="3"><textarea name="config.webRight" cols="50" rows="8" id="Copyright"><%=conf.getWebRight() %></textarea></td>
    </tr>
    
    <tr bgcolor="#ecf5ff"> 
      <td colspan="4" class="topbg"><strong>网站选项配置</strong></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td><strong>网站关键字设置：</strong></td>
      <td colspan="3"><textarea name="config.webKeyword" cols="50" rows="4" id="Copyright"><%=conf.getWebKeyword() %></textarea></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td><strong>后台每页产品或文章数：</strong></td>
      <td colspan="3"> <input name="config.webPage" type="text" id="MaxPerPage_Default" value="<%=conf.getWebPage() %>" size="6" maxlength="5"></td>
    </tr>
    <tr bgcolor="#ecf5ff"> 
      <td colspan="4" align="center">
        <input name="cmdSave" type="submit" value=" 保存设置 " > 
      </td>
    </tr>
  </table>

</form>
<jsp:include page="inc/Use9_Foot.jsp"></jsp:include>