<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>用户登录 famous</title>
		<link rel="stylesheet" type="text/css" media="screen"
			href="/css/screen.css" />
		<link href="/css/global/header.css" rel="stylesheet" type="text/css">
		<script src="/jquery-validate/lib/jquery.js" type="text/javascript"></script>
		<script src="/jquery-validate/jquery.validate.js"
			type="text/javascript"></script>
		<script type="text/javascript">
$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$().ready(function() {
	// validate the comment form when it is submitted
	// validate signup form on keyup and submit
	$("#logonForm").validate({
		rules: {
			username: {
				required: true,
				minlength: 3
			},
			password: {
				required: true,
				minlength: 5
			},
		},
		
		messages: {
			username: {
				required: "请输入用户名",
				minlength: "用户名必须大于三位"
			},
			password: {
				required: "请输入密码",
				minlength: "密码不小于5位"
			},

		},
		
	});
	

	

});
</script>

<style type="text/css">
<!--
.STYLE1 {color: #666666}
.logintitle H2 {
	DISPLAY: block; FONT-WEIGHT: bold; FONT-SIZE: 14px; MARGIN: 0px 0px 0px 0px;PADDING:0 0 0 10px;color:#525252
}
.ablue2{
	FONT-SIZE: 14px; color:#0066FF
}
-->
#logonForm { width: 500px; }
#logonForm label { width: 250px; }
#logonForm label.error, #logonForm input.submit { margin-left: 253px; }
	margin-left: 10px;
	width: auto;
	display: inline;
}
#newsletter_topics label.error {
	display: none;
	margin-left: 103px;
}
</style>

	</head>

	<body>
		<jsp:include page="/WEB-INF/page/share/simpleHead.jsp" />
		<!-- Head End -->
		<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
			<TBODY>
				<TR>
					<TD background="/images/login/login_03.jpg">
						&nbsp;
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<br />
		<!-- ..........错误信息显示................ -->
		<!-- ..........错误信息显示................ -->
		<center>
			<form path="/user/logon.action" id="logonForm" method="post"
				action="logonValidatorAction">
				<fieldset>
				
						<legend>
							请输入用户名密码.
						</legend>
				
					<p>
						<label for="cname">
							用户名(3位以上)
						</label>
						<input id="username" name="username" class="required"
							minlength="2" />
					</p>
					<p>
						<label for="password">
							密码(5位以上)
						</label>
						<input id="password" name="password" type="password" />
					</p>
					<p>
						<input class="submit" type="submit" value="Submit" />
					</p>
				</fieldset>
			</form>
		


		<jsp:include page="/WEB-INF/page/share/Foot.jsp" />
	</body>
</html>
