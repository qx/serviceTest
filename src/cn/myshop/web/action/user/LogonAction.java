package cn.myshop.web.action.user;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import cn.myshop.service.user.BuyerService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class LogonAction extends ActionSupport {
	@Resource(name = "buyerServiceBean")
	BuyerService buyerService;

	/**
	 * 1。类型转换器对请求参数执行类型转换，并把转换后的值赋给action中的属性。
	 * 
	 * 2。如果在执行类型转换的过程中出现异常，系统会将异常信息保存到ActionContext，conversionError拦截器将异常信息添加到fieldErrors里。不管类型转换是否出现异常，都会进入第3步。
	 * 
	 * 3。系统通过反射技术先调用action中的validateXxx()方法，Xxx为方法名。
	 * 
	 * 4。再调用action中的validate()方法。
	 * 
	 * 5。经过上面4步，如果系统中的fieldErrors存在错误信息（即存放错误信息的集合的size大于0)，系统自动将请求转发至名称为input的视图,即!不再执行action中其他方法。如果系统中的fieldErrors没有任何错误信息，系统将执行action中的处理方法。
	 * 
	 */
	private static final long serialVersionUID = -7435460863095647778L;

	private String buyername;

	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBuyername() {
		return buyername;
	}

	public void setBuyername(String buyername) {
		this.buyername = buyername;
	}

	public String execute() throws Exception {
		if (buyerService.checkUser(this.buyername.trim(), this.password.trim())) {
			ActionContext ctx = ActionContext.getContext();
			ctx.getSession().put("buyer", this.getBuyername());
		//	System.out.println("success");
			return SUCCESS;
		} else {
		//	System.out.println("input");
			this.addFieldError("fail_message1", "用户名或密码有错误");
			return INPUT;
		}
	}
//清空fielderror数据
	public void validate() {
		if (this.hasFieldErrors()) {
			this.clearErrorsAndMessages();
		}
	}
}
