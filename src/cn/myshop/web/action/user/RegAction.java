package cn.myshop.web.action.user;
import javax.annotation.Resource;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;

import cn.myshop.bean.user.Buyer;
import cn.myshop.service.user.BuyerService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class RegAction extends ActionSupport {
	@Resource(name = "buyerServiceBean")
	BuyerService buyerService;
	private String username;
	private String password;
	private String email;
	private String[] usernames;
	private String directUrl;
	private String realname;
	private String validateCode;	
	
	public String regUI() {
		System.out.println("regUI方法");
		return "reg";
	}

	public String reg() {
		System.out.println("reg方法");
		ActionContext ctx = ActionContext.getContext();
		if(!buyerService.exsit(this.username)){
			Buyer buyer = new Buyer(this.username,this.password, this.email);
			buyerService.save(buyer);
			ctx.getSession().put("user", buyer);
			//request.getSession().setAttribute("user", buyer);		
			//ctx.put("req", "request范围");//往request里放入req
        ctx.put("message", "用户注册成功");
		//	request.setAttribute("message", "用户注册成功");
			String url = "/customer/shopping/deliver.do";
			if(this.directUrl()!=null)
				url = (String) this.directUrl();
			//request.setAttribute("urladdress", url);
			ctx.put("urladdress", url);
//			return mapping.findForward("message");
			return "message";
		}else{
//			request.setAttribute("message", "用户已经存在");
			ctx.put("message", "用户已经存在");
//			return mapping.findForward("reg");
			return "reg";
		}
	}
	public String isUserExist(){
		ActionContext ctx = ActionContext.getContext();
		System.out.println("isUserExist方法");
		ctx.put("exsit", buyerService.exsit(this.username));
		if(buyerService.exsit(this.username)){
			System.out.println("存在此用户");
		}else{
			System.out.println("该名称可以用");
		}
		return "checkuser";
	}

	private Object directUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public String getDirectUrl() {
		return directUrl;
	}

	public void setDirectUrl(String directUrl) {
		if(directUrl!=null && !"".equals(directUrl.trim())){
			this.directUrl = new String(Base64.decodeBase64(directUrl.trim().getBytes()));//获取解码后的url
		}
	}
	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	
	public String[] getUsernames() {
		return usernames;
	}
	public void setUsernames(String[] usernames) {
		this.usernames = usernames;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
