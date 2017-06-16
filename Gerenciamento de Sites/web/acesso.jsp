<%@include file="conexao.jspf"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <%
        String codpro = request.getParameter("codpro")+"";
        
        int aux = st.executeUpdate("update prop set acessos = acessos + 1 where codpro= "+codpro+"");
        
        ResultSet res = st.executeQuery("Select * from prop where codpro= "+codpro+"");
        while(res.next()) {
            
            out.println("<script>window.location = 'http://"+res.getString("site")+"'</script>");
        }
    
    
    
    
    
    
    %>
    
    </body>
</html>
<%
 st.close();
 %>