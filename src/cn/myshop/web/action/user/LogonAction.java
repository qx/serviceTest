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
	 * 1������ת�������������ִ������ת��������ת�����ֵ����action�е����ԡ�
	 * 
	 * 2�������ִ������ת���Ĺ����г����쳣��ϵͳ�Ὣ�쳣��Ϣ���浽ActionContext��conversionError���������쳣��Ϣ��ӵ�fieldErrors���������ת���Ƿ�����쳣����������3����
	 * 
	 * 3��ϵͳͨ�����似���ȵ���action�е�validateXxx()������XxxΪ��������
	 * 
	 * 4���ٵ���action�е�validate()������
	 * 
	 * 5����������4�������ϵͳ�е�fieldErrors���ڴ�����Ϣ������Ŵ�����Ϣ�ļ��ϵ�size����0)��ϵͳ�Զ�������ת��������Ϊinput����ͼ,��!����ִ��action���������������ϵͳ�е�fieldErrorsû���κδ�����Ϣ��ϵͳ��ִ��action�еĴ�������
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
			this.addFieldError("fail_message1", "�û����������д���");
			return INPUT;
		}
	}
//���fielderror����
	public void validate() {
		if (this.hasFieldErrors()) {
			this.clearErrorsAndMessages();
		}
	}
}
