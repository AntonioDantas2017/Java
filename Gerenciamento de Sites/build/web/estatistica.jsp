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
        <title>Estatísticas</title>
        
        <script>
        
        function acesso(cod)
        {
            
            window.location = 'acesso.jsp?codpro='+cod;
            
        }
        
        </script>
        
        
    </head>
    <body>

    <font class="linkA">
        
         <%
                    double qtdac = 0;
                    double tot = 0;
                    
                    ResultSet res = st.executeQuery("Select acessos from prop");
                    while(res.next()) {
                    tot=1;
                        qtdac += res.getInt("acessos");
                    
                    }
                    
                    if(tot > 0)
                    {
                        
                        %>
     <table class="linkA"> 
        <tr>
            <td colspan="3" width="650"><b><center>Relatório de sites</center></b></td>
        </tr>
        <tr>
            <td width="250">Nome do Proprietário</td>
            <td width="250">Site</td>
            <td width="150">Percentual de Visitas</td>
        </tr>                          
                        
                        
                        <%
          
                    res = st.executeQuery("Select top 15 * from pro order by acessos desc");
                    String site = "";
                    while(res.next()) {
                        site = res.getString("site");
         %>
        
        <tr>
            <td width="250"><%
            
            out.println(res.getString("p2"));

%></td>
            <td width="250"><a onclick="acesso(<%out.print(res.getString("codpro"));%>)"><%out.print(site);%></a></td>
            <td width="150"><center><%
                if(qtdac > 0)
                {
                double t = res.getInt("acessos");
                tot = t/qtdac;
                //out.println("<script>alert('"+tot+"')</script>"); 
                tot = tot * 100;
                
                out.print(tot);
                
                }else{
                out.print("0");
                
                }
            
            %>%</center>
            </td>
        </tr>   
       
        <%
                    }
                    %>
                        </table> 
                    <%
                    }else{
                     %>
                        <font class="linkA2">Não há proprietários!</font>
                     <%
                    }
                    %>
                    

<BR><BR><BR>
 <a href="index.jsp">Volta ao Menu</a>   
 </font>
    </body>
</html>
<%
 st.close();
 %>