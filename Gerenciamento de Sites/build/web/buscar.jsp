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
        <title>Buscar Sites</title>
        
          <script>
        
        function acesso(cod)
        {
            
            window.location = 'acesso.jsp?codpro='+cod;
            //alert('acesso.jsp?codpro='+cod);
        }
        
        
        </script>
        
        
        
        
    </head>
    <body>
<font class="linkA">
 <form name="f1" action="buscar.jsp">
    <table class="linkA"> 
        <tr>
            <td colspan="3"><b><center>Pesquisa de Sites</center></b></td>
        </tr>
        <tr>
            <td>Escreva o nome do proprietário:</td>
            <td><input type="text" name="nome"></td>
            <td><input type="submit" Value="Buscar"></td>
            <input type="hidden" value="ok" name="acao"> 
        </tr>       
    </table>
</form>
<br><br>

<br><br>

<%

String nome = request.getParameter("nome")+"";

if(nome.equals(""))
{
 
%>

Digite o nome do proprietário
<%
}else{
int cont = 0;
ResultSet res = st.executeQuery("Select * from pro where p2 like '%"+nome+"%'");
while(res.next()) {
cont+=1;   
}
    
 
if(cont > 0)
{
%>
Resultado da pesquisa:<br>
<br>
<table class="linkA"> 
        <tr>
            <td colspan="2"><center>Encontrado <%out.println(cont);%> resgistro(s)</center></td>
        </tr> 
        <tr>
            <td width="250"><b><center>Nome do Proprietário</center></b></td>
            <td width="250"><b><center>Site</center></b></td>
        </tr>       
        
         <%
        ResultSet res2;
                    
                     res = st.executeQuery("Select * from pro where p2 like '%"+nome+"%'");
                    while(res.next()) {
                    String site = res.getString("site");
         %>
        
        <tr>
            <td><%
            
            out.println(res.getString("p2"));%></td>
            <td><center><a onclick="acesso(<%out.print(res.getString("codpro"));%>)"><%out.println(site);%></a></center></td>
        </tr>   
        
        <%
                    }
                    
}else{
    

    %>
    
Não foi encontrado proprietários com esse nome
    
    <%
}
          
}             %>
   
                    
    </table>
    <br><BR><BR>
<a href="index.jsp">Volta ao Menu</a>
</font>
    </body>
</html>
<%
 st.close();
 %>