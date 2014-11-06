package com.use9.frame.struts.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import com.use9.frame.struts.form.MyForm1;

public class MyAction extends DispatchAction {
	public ActionForward test(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MyForm1 f = (MyForm1) form;
		String password = f.getAddress();
		System.out.println("aaa" + password);
		if (password.equals("test")) {
			HttpSession session = request.getSession();
			session.setAttribute("username", password);
			return mapping.findForward("success");
		} else {
			ActionMessages messages = new ActionMessages();
			messages.add("fail.logon", new ActionMessage("msg.fail.logon"));
			saveMessages(request, messages);
			return mapping.findForward("failed");
		}
	}
}
