◄►▼▲●
第13章 ajax技术
$13.1 当下谁在用Ajax
$13.2 Ajax开发模式与传统开发模式的比较
$13.3 Ajax使用的技术
▲Ajax是XMLHttpRequest对象和JavaScript、XML、CSS、DOM等多种技术的组合。
▲Ajax使用的技术中，最核心的技术就是XMLHttpRequest，它是一个具有应用程序接口的JavaScript对象，能够使用超文本传输协议（HTTP）连接一个服务器。
▲XMLHttpRequest对象与服务器交换的数据通常采用XML格式。

$13.4 使用XMLHttpRequest对象
▲通过XMLHttpRequest对象，Ajax可以像桌面应用程序一样，只同服务器进行数据层面的交换，而不用每次都刷新页面，也不用每次都将数据处理的工作交给服务器来完成，
 这样既减轻了服务器负担，又加快了响应速度，缩短了用户等待的时间。
 
13.4.1 初始化XMLHttpRequest对象
▲非IE浏览器把XMLHttpRequest对象实例化为一个本地JavaScript对象：
    var http_request=new XMLHttpRequest();
▲为了提高程序的兼容性，可以创建一个跨浏览器的XMLHttpRequest对象。
 判断一下不同浏览器的实现方式，如果浏览器提供了XMLHttpRequest类，则直接创建一个实例。
 否则实例化一个ActiveX对象。
    if(window.XMLHttpRequest)  //非IE浏览器
    {
    	http_request=new XMLHttpRequest();
    }
    else if(window.ActiveXObject)  //IE浏览器
    {
    	try
    	{
    		http_request=new ActiveXObject("Msxml2.XMLHTTP");
    	}
    	catch(e)
    	{
    		try
    		{
    			http_request=new ActiveXObject("Microsoft.XML.HTTP");
    		}
    		catch(e)
    		{}
    	}
    }
    
13.4.2 XMLHttpRequest对象的常用方法
▲XMLHttpRequest对象提供了一些常用方法，通过这些方法可以对请求进行操作。
▲open()方法
·open()方法用于设置进行异步请求目标的URL、请求方法以及其他参数信息。
·语法：
    open("method","URL"[,asyncFlag [,"userName" [,"password"]]])
·参数说明：
    method：用于指定请求的类型，一般为GET或POST
    URL：用于指定请求地址，可以使用绝对地址或者相对地址，并且可以传递查询字符串。
    asynFlag：可选，用于指定请求方式，异步请求为true，同步请求为false，默认为true
    userName：可选，指定请求用户名
    password：可选，用于指定请求密码
·eg：设置异步请求目标为register.jsp，请求方法为GET，请求方式为异步
    http_request.open("GET","register.jsp",true);
▲send()方法
·send()方法用于向服务器发送请求。如果请求声明为异步，该方法将立即返回，否则将等到接受到响应为止。
·语法：
    send(content);
·参数说明：
    content：用于指定发送的数据，可以是DOM对象的实例、输入流或字符串。可以是null。
·eg：向服务器发送一个不包含任何参数的请求
    http_request.send(null);
▲setRequestHeader()方法
·setRequestHeader()方法用于为请求的HTTP头设置值。
·语法：
    setRequestHeader("header","value")
·参数说明：
    header：用于指定HTTP头
    value：用于为指定的HTTP头设置值
·setRequestHeader()方法只能在open()方法之后调用
▲abort()方法
·用于停止或放弃当前异步请求
▲getResponseHeader()方法
·用于以字符串形式返回指定的HTTP头信息。
·语法：
    getResponseHeader("headerLabel")
·参数说明：
    headerLabel：用于指定HTTP头，包括Server、Content-Type和Date等。
·eg：获取HTTP头Content-Type的值
    http_request.getResponseHeader("Content-Type")
▲getAllResponseHeaders()方法
·用于以字符串形式返回完整的HTTP头信息
·eg：
    alert(http_request.getAllResponseHeaders());
    
13.4.3 XMLHttpRequest对象的常用属性
▲onreadystatechange属性：用于指定状态改变时所触发的事件处理器。每个状态改变时都会触发这个事件处理器。通常会调用一个JS函数。
▲readyState属性
▲responseText属性
▲responseXML属性
▲status属性
▲statusText属性

$13.5 与服务器通信——发送请求与处理响应

13.5.1 发送请求
▲Ajax可以通过XMLHttpRequest对象实现采用异步方式在后台发送请求。
 通常情况下，Ajax发送请求有两种，一种是发送GET请求，另一种是发送POST请求。
 无论发送哪种请求，都需要经过4个步骤：
1.初始化XMLHttpRequest对象。为了提高程序的兼容性，需要创建一个跨浏览器的XMLHttpRequest对象，
    并且判断XMLHttpRequest对象的实例是否成功，如果不成功，则给予提示。




13.5.3 一个完整的实例——检测用户名是否唯一
▲创建index.jsp文件
    <form method="post" action="" name="form1">
    	username:<input name="username" type="text" id="username" size="32"/>
    	<img src="images/checkBt.jpg" width="104" height="23" style="cursor: hand;" onclick="checkUser(form1.username);" />
    	password:<input name="pwd1" type="password" id="pwd" size="35" />
    	comfirm password:<input name="pwd2" type="password" id="pwd2" size="35" />
    	E-mail:<input name="email" type="text" id="email" size="45" />
    	<input type="image" name="imageField" src="images/registerBt.jpg" />
    </form>
▲添加一个用于显示提示信息的<div>标志
	<style type="text/css">
		<!--
			#toolTip
			{
				position: absolute;
				left: 331px;
				top: 39px;
				width: 98px;
				height: 48px;
				padding-top: 45px;
				padding-left: 25px;
				padding-right: 25px;
				z-index: 1;
				display: none;
				color: red;
				background-image: url(images/tooltip.jpg);
			}
		-->
	</style>
	<div id="toolTip"></div>
▲编写一个自定义的JS函数createRequest()，在该函数中，首先初始化XMLHttpRequest对象，然后指定处理函数，再创建与服务器连接，最后向服务器发送请求。
    function createRequest(url)
    {
    	http_request=false;
    	if(window.XMLHttpRequest)
    	{
    		http_request=new XMLHttpRequest();
    	}
    	else if(window.ActiveXObject)
    	{
    		try
    		{
    			http_request=new ActiveXObject("Msxml2.XMLHTTP");
    		}
    		catch(e)
    		{
    			try
    			{
    				http_request=new ActiveXObject("Microsoft.XMLHTTP");
    			}
    			catch(e)
    			{}
    		}
    	}
    	if(!http_request)
    	{
    		alert("can not create XMLHttpRequest object!");
    		return false;
    	}
    	http_request.onreadystatechange=getResult;
    	http_request.open('GET',url,true);
    	http_request.send(null);
    }
▲编写回调函数getResult()，该函数主要根据请求状态对返回结果进行处理。
 在该函数中，如果请求成功，为提示框设置相应内容，并且让该提示框显示。
    function getResult()
    {
    	if(http_request.readyState==4)
    	{
    		if(http_request.status==200)
    		{
    			document.getElementByld("toolTip").innerHTML=http_request.responseText;
    			document.getElementByld("toolTip").style.display="block";
    		}
    		else
    		{
    			alert("您所请求的页面有错误！");
    		}
    	}
    }
▲编写自定义的JS函数checkUser()，用于检测用户名是否为空，
  当用户名不为空时，调用createRequest()函数发送异步请求检测用户名是否被注册。
    function checkUser(userName)
    {
    	if(userName.value=="")
    	{
    		alert("enter the username please!");
    		userName.focus();
    		return;
    	}
    	else
    	{
    		createRequest('checkUser.jsp?user='+userName.value);
    	}
    }
▲编写检测用户名是否被注册的处理页checkUser.jsp，在该页面中判断输入的用户名是否注册，
  并应用JSP内置对象out的println()方法输出判断结果。
    <%
    	String[] userList={"lsw","lsw2","lsw3","lsw4"};
    	String user=new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
    	Arrays.sort(userList);
    	int result=Arrays.binarySearch(userList,user);
    	if(result>-1)
    	{
    		out.println("sorry,this user has registered.")
    	}
    	else
    	{
    		out.println("congratulation! this name can be used.");
    	}
    %>
