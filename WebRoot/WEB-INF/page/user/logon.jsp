<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /> 
<title>用户登录</title> 
 <link href="/css/global/header.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" media="screen"
			href="/jq/css/screen.css" />

		<script src="/jq/lib/jquery.js" type="text/javascript"></script>
		<script src="/jq/jquery.validate.js" type="text/javascript"></script>
		
 
<script type="text/javascript"> 
//$.validator.setDefaults({
//	submitHandler: function() { alert("submitted!"); }
//});
 
$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();
	
	// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			firstname: "required",
			lastname: "required",
			buyername: {
				required: true,
				minlength: 2
			},
			password: {
				required: true,
				minlength: 5
			},
			confirm_password: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			topic: {
				required: "#newsletter:checked",
				minlength: 2
			},
			agree: "required"
		},
		messages: {
			firstname: "Please enter your firstname",
			lastname: "Please enter your lastname",
			buyername: {
				required: "Please enter a buyername",
				minlength: "Your buyername must consist of at least 2 characters"
			},
			password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 5 characters long"
			},
			confirm_password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 5 characters long",
				equalTo: "Please enter the same password as above"
			},
			email: "Please enter a valid email address",
			agree: "Please accept our policy"
		}
	});
	
	// propose buyername by combining first- and lastname
	$("#buyername").focus(function() {
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		if(firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});
	
	//code to hide topic selection, disable for demo
	var newsletter = $("#newsletter");
	// newsletter topics are optional, hide at first
	var inital = newsletter.is(":checked");
	var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
	var topicInputs = topics.find("input").attr("disabled", !inital);
	// show when newsletter is checked

});
</script> 
 
<style type="text/css"> 
#signupForm { width: 500px; }
#signupForm label.error, #signupForm input.submit { margin-left: 0px; }

#newsletter_topics label.error {
	display: none;
	margin-left: 103px;
}
</style> 
 
</head> 
<body> 
 <jsp:include page="/WEB-INF/page/share/simpleHead.jsp"/>

<div id="main"> 
<form class="cmxform" id="signupForm" method="post" action="${pageContext.request.contextPath}/user/logon"> 
	<fieldset> 
		<legend>Please Login:当前用户是${sessionScope.buyer}</legend> 
		<p> 
			buyername:&nbsp&nbsp&nbsp
			<input id="buyername" name="buyername" />

		
		</p> 
		<p> 
			Password:&nbsp&nbsp&nbsp
			<input id="password" name="password" type="password" /> 
		</p> 
		<p> 
		<!-- 	<input class="submit" type="submit" value="Submit"/>  -->
			<input type="image" name="ImageButton1" src="/images/global/regloginbutton2.jpg" alt="" border="0" />
		</p> 
	</fieldset> 
</form> 
 <!--
<form class="cmxform" id="signupForm" method="get" action=""> 
	<fieldset> 
		<legend>Validating a complete form</legend> 
		<p> 
			<label for="firstname">Firstname</label> 
			<input id="firstname" name="firstname" /> 
		</p> 
		<p> 
			<label for="lastname">Lastname</label> 
			<input id="lastname" name="lastname" /> 
		</p> 
		<p> 
			<label for="buyername">buyername</label> 
			<input id="buyername" name="buyername" /> 
		</p> 
		<p> 
			<label for="password">Password</label> 
			<input id="password" name="password" type="password" /> 
		</p> 
		<p> 
			<label for="confirm_password">Confirm password</label> 
			<input id="confirm_password" name="confirm_password" type="password" /> 
		</p> 
		<p> 
			<label for="email">Email</label> 
			<input id="email" name="email" /> 
		</p> 
		<p> 
			<label for="agree">Please agree to our policy</label> 
			<input type="checkbox" class="checkbox" id="agree" name="agree" /> 
		</p> 
		<p> 
			<label for="newsletter">I'd like to receive the newsletter</label> 
			<input type="checkbox" class="checkbox" id="newsletter" name="newsletter" /> 
		</p> 
		<fieldset id="newsletter_topics"> 
			<legend>Topics (select at least two) - note: would be hidden when newsletter isn't selected, but is visible here for the demo</legend> 
			<label for="topic_marketflash"> 
				<input type="checkbox" id="topic_marketflash" value="marketflash" name="topic" /> 
				Marketflash
			</label> 
			<label for="topic_fuzz"> 
				<input type="checkbox" id="topic_fuzz" value="fuzz" name="topic" /> 
				Latest fuzz
			</label> 
			<label for="topic_digester"> 
				<input type="checkbox" id="topic_digester" value="digester" name="topic" /> 
				Mailing list digester
			</label> 
			<label for="topic" class="error">Please select at least two topics you'd like to receive.</label> 
		</fieldset> 
		<p> 
			<input class="submit" type="submit" value="Submit"/> 
		</p> 
	</fieldset> 
</form> 
 
<h3>Syntetic examples</h3> 
<ul> 
	<li><a href="errorcontainer-demo.html">Error message containers in action</a></li> 
	<li><a href="custom-messages-metadata-demo.html">Custom Messages as Metadata</a></li> 
	<li><a href="radio-checkbox-select-demo.html">Radio and checkbox buttons and selects</a></li> 
	<li><a href="ajaxSubmit-intergration-demo.html">Integration with Form Plugin (AJAX submit)</a></li> 
	<li><a href="custom-methods-demo.html">Custom methods and message display.</a></li> 
	<li><a href="dynamic-totals.html">Dynamic forms</a></li> 
	<li><a href="themerollered.html">Forms styled with jQuery UI Themeroller</a></li> 
</ul>

<h3>Real-world examples</h3>

<ul>

	<li><a href="milk/">Remember The Milk signup form</a></li>

	<li><a href="marketo/">Marketo signup form</a></li>

	<li><a href="multipart/">Buy and Sell a House multipart form</a></li>

	<li><a href="captcha/">Remote captcha validation</a></li>

</ul> 
 
<h3>Testsuite</h3> 
<ul> 
	<li><a href="../test/">Validation Testsuite</a></li> 
</ul>	
   -->
</div> 
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"> 
</script> 
<script type="text/javascript"> 
_uacct = "UA-2623402-1";
urchinTracker();
</script> 
<jsp:include page="/WEB-INF/page/share/Foot.jsp"/>
</body> 
</html>