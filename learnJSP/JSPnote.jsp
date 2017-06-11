◄►▼▲●
第五章 JSP
$5.1 了解JSP页面
$5.2 指令标识
5.2.1 page指令
▲session属性
·是否使用HTTP的session会话对象，默认是true
▲buffer属性
·设置JSP的out输出对象使用的缓冲区大小，默认8KB，单位只能是KB一般是8的倍数
▲isErrorPage属性
·该属性可以将当前页面设置成错误处理页面来处理另一个JSP页面的错误，也就是异常处理
·如果是的话，设置为true，一般是false
▲errorPage属性
·指定当前页面的异常处理页面，被指定的页面isErrorPage属性必须为true
·其属性值是一个url字符串
·eg：
    <%@page errorPage="error/loginErrorPage.jsp"%>

5.2.2 include指令
▲通过该指令可以在一个JSP页面中包含另一个JSP页面
▲静态包含，被包含的JSP文件中的代码不会被编译执行
▲在包含和被包含的文件中，不能有相同名称的变量
·eg：
    <%@include file="path"%>
·路径可以是相对路径或绝对路径，但是不可以是通过<%=%>表达式所代表的文件

5.2.3 taglib指令
▲在JSP文件中，可以通过taglib指令标识声明该页面中所使用的标签库，同时引用标签库，并指定标签的前缀
▲参数：
·prefix：用于指定标签的前缀。前缀不能使jsp关键字
·uri：用于指定标签库文件存放的位置
·eg：在页面中引用JSTL的核心标签库
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

$5.3 脚本标识
▲JSP中脚本标识包括3部分：JSP表达式（Expression）、声明标识（Declaration）、脚本标识（Scriptlet）
·通过这些标识，在JSP页面中可以像编写java程序一样来声明变量，定义函数或进行各种表达式的运算。
5.3.1 JSP表达式
▲JSP表达式用于向页面中输出信息   <%= 表达式%>
·表达式：可以是任何java语言的完整表达式，该表达式的最终运算结果将被转换为字符串
▲JSP表达式可以插入到HTML标记中，用于动态设置属性值

5.3.2 声明标识
▲用于在JSP页面中定义全局的变量或方法
·服务器执行JSP页面时，会将JSP页面转换为Servlet类，在该类中会把使用JSP声明标识定义的变量和方法转换为类的成员变量和方法
▲格式：   <%! 
             声明变量或方法的代码 
	         %>
			 
5.3.3 代码片段
▲代码片段将在页面请求的处理期间被执行。
▲生命周期是页面关闭后就会被销毁

$5.4 JSP注释
5.4.1 HTML注释
▲直接//
▲不会显示，但是看源码可以看到
5.4.2 代码片段中的注释同java注释
5.4.3 隐藏注释：<%-- 注释内容 --%>
5.4.4 动态注释
▲eg：将当前日期和时间作为HTML注释文本
    <!-- <%=new Date()%> -->
	
$5.5 动作标识
5.5.1 包含文件标识<jsp:include>
▲JSP的动作标识<jsp:include>用于向当前页面中包含其他的文件。被包含的文件可以是动态或者静态的。
▲语法：    
    <jsp:include page="url" flush="false|true" />
	或是
	<jsp:include page="url" flush="false|true">
	子动作标识<jsp:param>
	</jsp:include>
▲参数说明：
·page：用于指定被包含文件的 相对路径
·flush：默认false，设置是否刷新缓冲区，如果是true，先刷新缓冲区再执行包含工作
·子动作标识<jsp:param>:用于向被包含的动态页面中传递参数
●在应用页面包含功能时，为了使整个页面的层次结构不发生冲突，建议在被包含页面中将<html>,<body>等标记删除

5.5.2 请求转发标识<jsp:forward>
▲通过<jsp:forward>动作标识，可以将请求转发到其他的web资源，例如，另一个JSP页面、HTML页面、Servlet等。执行请求转发后，当前页面将不再被执行，而是去执行该标识指定的目标页面。
▲语法：
    <jsp:forward page="url"/>
	或者是
	<jsp:forward page="url">
	子动作标识<jsp:param>
	</jsp:forward>
▲参数说明：
·子动作标识<jsp:param>:用于向转向的目标文件中传递参数

5.5.3 传递参数标识<jsp:param>
▲JSP的动作标识<jsp:param>可以作为其他标识的子标识，用于为其他标识传递参数。
▲语法：
    <jsp:param name="参数名" value="参数值"/>
▲eg：
    <jsp:forward page="modify.jsp">
	    <jsp:param name="userId" value="7"/>
	</jsp:forward>
▲它的功能与 在文件名后面直接加 "？参数名=参数值" 是相同的

第六章 JSP内置对象
$6.1 JSP内置对象的概述
▲在使用JSP内置对象时，不需要先定义这些对象，直接使用即可
▲request, response, session, application, out, pageContext, config, page, exception

$6.2 request对象
▲request对象封装了由客户端生成的HTTP请求的所有细节，主要包括HTTP头信息、系统信息、请求方式和请求参数等。
·通过request对象提供的相应方法可以处理客户端浏览器提交的HTTP请求中的各项参数。

6.2.1 访问请求参数
▲超链接中的参数
    <a href="delete.jsp?id=1&name='s'>删除</a>
	在delete.jsp页面中，可以通过request对象的getParameter()方法获取传递的参数值
	<%
	request.getParameter("id");
	%>
▲如果指定的参数不存在，将返回null，如果未指定参数值，将返回空字符串""。

6.2.2 在作用域中管理属性
▲在进行请求转发时，需要把一些数据传递到转发后的页面进行处理。可以使用request对象的setAttribute()方法将数据保存到request范围内的变量中。
▲语法
    request.setAttribute(String name,Object obj);
▲参数说明：
·name：表示变量名
·object：变量值，东西
▲获取变量值
    request.getAttribute(String name);
    
6.2.3 获取cookie
▲cookie是小段的文本信息，在网络服务器上生成并发送给浏览器。
▲通过使用cookie可以标识用户身份，记录用户名和密码，跟踪重复用户等。
▲浏览器将cookie以key-value的形式保存到客户机的某个指定目录中。
▲获取到所有cookie对象的集合：cookie.getCookies()
▲获取指定名称的cookie： cookie.getName("");
▲获取cookie对象的值： cookie.getValue();
▲将一个cookie对象发送到客户端： response.addCookie();

6.2.4 解决中文乱码
▲new String(str,"utf-8")

6.2.5 获取客户端信息
▲代码：
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用request对象的相关方法获取客户端信息</title>
</head>
<body>
<br>客户提交信息的方式：<%=request.getMethod()%>
<br>使用的协议：<%=request.getProtocol()%>
<br>获取发出请求字符串的客户端地址：<%=request.getRequestURI()%>
<br>获取发出请求字符串的客户端地址：<%=request.getRequestURL()%>
<br>获取提交数据的客户端IP地址：<%=request.getRemoteAddr()%>
<br>获取服务器端口号：<%=request.getServerPort()%>
<br>获取服务器的名称：<%=request.getServerName()%>
<br>获取客户端的主机名：<%=request.getRemoteHost()%>
<br>获取客户端所请求的脚本文件的文件路径:<%=request.getServletPath()%>
<br>获得Http协议定义的文件头信息Host的值:<%=request.getHeader("host")%>
<br>获得Http协议定义的文件头信息User-Agent的值:<%=request.getHeader("user-agent")%>
<br>获得Http协议定义的文件头信息accept-language的值:<%=request.getHeader("accept-language")%>
<br>获得请求文件的绝对路径:<%=request.getRealPath("index.jsp")%>
</body>
</html>

6.2.6 显示国际化信息

$6.3 response对象
▲response对象用于相应客户请求，向客户端输出信息
▲response对象在JSP页面内有效

6.3.1 重定向网页
▲语法：
    response.sendRedirect(String path);
▲参数说明：path：用于指定目标路径，可以是相对路径，也可以是不同主机的其他URL地址。
▲重定向之后的代码都失效了

6.3.2 处理HTTP文件头
1.禁用缓存
2.设置页面自动刷新
3.定时跳转网页

6.3.3 设置输出缓冲

$6.4 session对象

6.4.1 创建及获取客户的会话
▲setAttribute()方法
·用于将信息保存在session范围内
·语法：
    session.setAttribute(String name,Object obj)  //name:变量名 obj：变量值
·eg：
    session.setAttribute("username","绿草");
▲getAttribute()方法
·用于获取保存在session范围内的信息
·语法：
    getAttribute(String name)
·eg：
    session.getAttribute("username"); //返回的是Object类型
 
6.4.2 从会话中移动指定的绑定对象
▲removeAttribute(String name)方法
·将对象从session会话中移除

6.4.3 销毁session
▲session.invalidate();

6.4.4 会话超时的管理

6.4.5 session对象的应用

$6.5 application对象
▲application对象用于保存所有应用程序中的公有数据。
 它在服务器启动时自动创建，在服务器停止时销毁。
 当application对象没有被销毁时，所有用户都可以共享application对象。
 与session对象相比，application对象的生命周期更长，类似于系统的“全局变量”。

6.5.1 访问应用程序初始化参数
▲application对象提供了对应用程序初始化参数进行访问的方法。
  应用程序初始化参数在web.xml文件中进行设置，web.xml文件位于Web应用所在目录下的WEB-INF子目录中。
  在web.xml文件中通过<context-param>标记配置应用程序初始化参数。
▲eg：在web.xml文件中配置连接MySQL数据库所需的url参数。
    <context-param>
    	<param-name>url</param-name>
    	<param-value>jdbc:musql://127.0.0.1:3306/dbname</param-value>
    </context-param>
   </web-app>
▲getInitParameter()方法
·用于返回已命名的参数值
·语法：
    application.getInitParameter(String name);  //name是参数名
▲getAttributeNames()方法
·用于返回所有 已定义的 应用程序初始化参数名 的枚举。
·语法：
    application.getAttributeNames();
    
6.5.2 管理应用程序环境属性

$6.6 out对象

6.6.1 向客户端输出数据
▲print()方法
·用于向客户端浏览器输出信息。与使用jsp表达式输出信息相同
·eg：
    <%
    	out.print("123");
    %>
        或者是
    <%="123"%>
▲println()方法
·改方法自带一个换行符

6.6.2 管理响应缓冲

$6.7 其他内置对象

6.7.1 获取会话范围的pageContext对象

6.7.2 读取web.xml配置信息的config对象

6.7.3 应答或请求的page对象
▲可以看做是this关键字的别称

6.7.4 获取异常信息的exception对象
▲getMessage()
    
