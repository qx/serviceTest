package cn.myshop.web.action.user;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import cn.myshop.service.user.BuyerService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Controller
public class LogoutAction extends ActionSupport {
	@Resource(name = "buyerServiceBean")
	BuyerService buyerService;
	public String execute() {
		
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		//System.out.print(session.get("buyer"));
		session.clear();
		//System.out.print(session.get("buyer"));
        return SUCCESS;
}
}
