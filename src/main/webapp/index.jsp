<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<html>
	<head>
		<title>Simple JSP version page</title>
	</head>
	<body>
		<h1>Simple JSP page</h1>
		<h2>Server info</h2>
        <p>
        request.getServletContext().getServerInfo() = <%= request.getServletContext().getServerInfo() %><br>
        </p>
		<h2>Version info</h2>
		<p>
		<%
			Properties versionProps = new Properties();
			InputStream in = getClass().getResourceAsStream("/version.properties");
			if (in != null) {
			versionProps.load(in);
			in.close();

			Set<String> versionPropKeys = versionProps.stringPropertyNames();
			Iterator<String> iter = versionPropKeys.iterator();
			while (iter.hasNext()) {
				String key = iter.next();
				String value = versionProps.getProperty(key);
				out.println(key + " = " + value + "<br>");
			}
			} else {
				out.println("No version.properties file found<br>");
			}
			
		%>
		</p>
	</body>
</html>
