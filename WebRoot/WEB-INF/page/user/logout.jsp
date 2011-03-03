<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //设置编码
	session.removeAttribute("user");//清空session
	response.sendRedirect("index.jsp");//跳转页面
%>