◄►▼▲●
第7章 JavaBean技术
▲JavaBean是用Java语言所写成的可重用组件。

$7.1 Javabean介绍

7.1.1 JavaBean概述

7.1.2 JavaBean种类
▲可视化的JB
▲非可视化的JB
▲eg：验证邮箱地址是否合法
    <form action="result.jsp" method="post">
    	<table align="center" width="300" border="1" height="150">
    		<tr>
    			<td colspan="2" align="center">
    				<b>邮箱认证系统</b>
    			</td>
    		</tr>
    		<tr>
    			<td align="right">邮箱地址：</td>
    			<td>
    				<input type="text" name="mailAdd"/>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" />
    			</td>
    		</tr>
    	</table>
    </form>
    
    result.jsp:
    
    <div align="center">
    	<%
    		String mailAdd=request.getParameter("mailAdd");
    		Email email new Email(mailAdd);
    		if(email.isEmail())
    		{
    			out.print(mailAdd+"<br>是一个标准的邮箱地址<br>");
    		}
    		else
    		{
    			out.print(mailAdd+"<br>不是一个标准的邮箱地址<br>");
    		}
    	%>
    	<a href="index7-1-2.jsp">return</a>
    </div>
    
$7.2 JavaBean的应用

7.2.1 获取JB属性信息
▲<jsp:useBean>
▲<jsp:getPropertty>
▲JB的书写要严格遵守JB的规范

7.2.2 对JB属性赋值
▲<jsp:setProperty>
	
7.2.3 如何在JSP页面中应用JB

$7.3 在JSP中应用JB

7.3.1 解决中文乱码的JB
7.3.2 在JSP页面中用来显示时间的JB
7.3.3 数组转换成字符串

第8章 Servlet技术
▲Servlet主要用于处理各种业务逻辑（逻辑层）
▲安全性、扩展性、性能

$8.1 Servlet基础
▲Servlet是运行在Web服务器端的Java应用程序，它使用Java语言编写，具有Java语言的优点。
 与Java程序的区别是，Servlet对象主要封装了对HTTP请求的处理，并且它的运行需要Servlet容器的支持，
 在JavaWeb应用方面，Servlet的应用占有十分重要的地位，它在Web请求的处理功能方面也非常强大。
 
8.1.1 Servlet结构体系
▲HttpServlet是Servlet的实现类，并提供了HTTP请求的处理方法。

8.1.3 Servlet与JSP的区别
▲Servlet是使用Java Servlet接口（API）运行在Web应用服务器上的Java程序，
  其功能十分强大，它不但可以处理HTTP请求中的业务逻辑，而且还可以输出HTML代码来显示指定页面。
▲JSP是一种在Servlet规范之上的动态网页技术。（显示层）

8.1.4 Servlet代码结构
▲在Java中，通常所说的Servlet是指HttpServlet对象，在声明一个对象为Servlet时，需要继承HttpServlet类。
 HttpServlet类是Servlet接口的一个实现类，继承该类后，可以重写HttpServlet类中的方法对HTTP请求进行处理。
▲eg：
    import java.io.IOException;
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    
    public class TestServlet extends HttpServlet 
    {
	//初始化方法
	public void init() throws ServletException
	 {
	 }
	//处理HTTP Get请求
	public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException 
	 {
	 }
	//处理HTTP Post请求
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
	 }
	//处理HTTP Put请求
	public void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
	 }
	//处理HTTP Delete请求
	public void doDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	 {
	 }
	//销毁方法
	public void destroy() 
	 {
		super.destroy();
	 }
    }
    
8.2.1 Servlet接口
▲eg：创建一个Servlet，实现向客户端输出一个字符串
    public class WordServlet implements Servlet
    {
    	public void destroy()
    	{
    		
    	}
    	
    	public ServletConfig getServletConfig()
    	{
    		return null;
    	}
    	
    	public String getServletInfo()
    	{
    		return null;
    	}
    	
    	public void init(ServletConfig arg0) throws ServletException
    	{
    		
    	}
    	
    	public void service(ServletRequest request,ServletResponse response) throws ServletException,IOException
    	{
    		PrintWriter pwt=response.getWriter();
    		pwt.println("123456");
    		pwt.close();
    	}
    }
▲在Servlet中，主要的方法是service()，
 当客户端请求到来时，Servlet容器将调用Servlet实例的service()方法对请求进行处理。
 本例在service()方法中，首先通过ServletResponse类中的getWriter()方法调用得到一个PrintWriter类型的输出流对象out，
 然后调用out对象的println()方法向客户端发送字符串123456，最后关闭out对象。
 
8.2.2 ServletConfig对象
▲它封装了Servlet的配置信息，在Servlet初始化期间被传递，每一个Servlet都有且仅有一个ServletConfig对象。

8.2.3 HttpServletRequest接口

8.2.4 HttpServletResponse接口

8.2.5 GenericServlet类

8.2.6 HttpServlet类
▲HttpServlet类仍然是一个抽象类，实现了service()方法，
 并针对HTTP1.1中定义的7种请求类型提供了相应的方法
▲doGet()
▲doPost()
▲doPut()
▲doDelete()
▲doHead()
▲doTrace()
▲doOptions()
▲只有doTrace()和doOptions()两个方法有简单实现，其他方法需要程序员重写

$8.3 Servlet开发

8.3.1 Servlet创建

8.3.2 Servlet配置
▲要使Servlet对象正常地运行，需要进行适当的配置，以告知Web容器哪一个请求调用哪一个Servlet对象处理，对Servlet起到一个注册的作用。
 Servlet的配置包含在web.xml文件中，主要通过以下两步进行设置。
 1.声明Servlet对象
    在web.xml文件中，通过<servlet>标签声明一个Servlet对象。
    在此标签下，包含两个主要子元素，<servlet-name>与<servlet-class>
    前者用于指定Servlet的名称；后者用于指定Servlet对象的完整位置，包含Servlet对象的包名与类名。
    其声明语句：
    <servlet>
    	<servlet-name>Simple Servlet</servlet-name>
    	<servlet-class>com.lsw.serv.FirstServ</servlet-class>
    </servlet>
 2.映射Servlet
    在web.xml文件中声明了Servlet对象后，需要映射访问Servlet的URL。
    该操作使用<servlet-mapping>标签进行配置。
    <servlet-mapping>标签包含两个子元素：<servlet-name>与<url-pattern>
    其中，<servlet-name>元素与<servlet>标签中的<servlet-name>元素相对应，不可以随意命名。
    <url-pattern>元素用于映射访问URL
    其配置方法如下：
    <servlet-mapping>
    	<servlet-name>SimpleServlet</servlet-name>
    	<url-pattern>/SimpleServlet</url-pattern>
    </servlet-mapping>
▲eg:
    <web-app version="2.5"   
    xmlns="http://java.sun.com/xml/ns/javaee"   
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"   
    xsi:schemaLocation="http://java.sun.com/xml/ns/javaee   
    http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">  
  <servlet>  
     <!-- 类名 -->  
    <servlet-name>HelloServlet</servlet-name>  
    <!-- 所在的包 -->  
    <servlet-class>com.runoob.test.HelloServlet</servlet-class>  
  </servlet>  
  <servlet-mapping>  
    <servlet-name>HelloServlet</servlet-name>  
    <!-- 访问的网址 -->  
    <url-pattern>/TomcatTest/HelloServlet</url-pattern>  ///文件夹/类名
    </servlet-mapping>  
  </web-app> 
  
第9章 过滤器和监听器
$9.1 Servlet过滤器
▲Servlet过滤器
