<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
logon_fail.jsp 登录失败,当前session中的属性是${sessionScope.buyer}
 <s:fielderror>
	 < s:param value="%{'fail_message1'}" />	
</s:fielderror>
<a href="${pageContext.request.contextPath}/user/logon_clearError">返回登录</a>
</body>
</html>