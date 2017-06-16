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
        <title>Gerenciamento de Sites</title>
    </head>
    <body>
    <font class="linkA">

    <%
    String prop = request.getParameter("nprop")+"";
  String login = request.getParameter("nlogin")+"";
  String senha = request.getParameter("nsenha")+"";
  String acao = request.getParameter("acao")+"";
  
        
  if(acao.equals("cad"))
  {
                   int aux = st.executeUpdate("insert into proprietarios (proprietario,login,senha) values ('"+prop+"','"+login+"','"+senha+"')");  
            out.println("<script>alert('O proprietário foi cadastrado com sucesso')</script>");   
        
      }    
 
        %>

        <font class="linkA2">Gerenciamento de Sites</font> <BR><BR>
        
   <a href="buscar.jsp">Pesquisar Proprietário</a><br>
   
    <a href="estatistica.jsp">Estatística de acessos</a><BR><BR><BR>
    
    
Cadastrar Site:<br>
    
    <form name="f1" method="post" action="gerenciar.jsp">   
    
    <table class="linkA">
    
    <TR><TD>Login: &nbsp;<input type="text" size="10" name="login"></td></tr>
    <TR><TD>Senha: <input type="password" size="10" name="senha"></td></tr>
    <TR><TD><input type="submit" value="Entrar"  class="linkA"></td></tr>
    </table>
    
    </form>   
<BR><BR><BR>
  
<form name="g1" action="index.jsp">
    <table class="linkA"> 
        <tr>
            <td colspan="3"><b><center>Cadastro de Proprietários</center></b></td>
        </tr>
        <tr>
            <td>Escreva o nome do proprietário:</td>
            <td><input type="text" name="nprop"></td>
            
        </tr>       
        <tr>
            <td>Escreva o login do proprietário:</td>
            
            <td><input type="text" name="nlogin"></td>
            
        </tr>       <tr>
            <td>Escreva a senha do proprietário:</td>
            <td><input type="text" name="nsenha"></td>
            
                    </tr>       
        <tr>
            
            <input type="hidden" value="cad" name="acao" class="linkA"> 
            <td colspan="2"><input type="submit" Value="Cadastrar novo proprietário"></td>
            
        </tr>       
        
    </table>
   </form>

    <h1></h1>
</font>   
 
    </body>
</html>
 <%
 st.close();
 %>
