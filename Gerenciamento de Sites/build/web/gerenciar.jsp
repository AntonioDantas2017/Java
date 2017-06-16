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

<%   

  String login = request.getParameter("login")+"";
  String senha = request.getParameter("senha")+"";

   
   String qtd = "0";
                    ResultSet res = st.executeQuery("Select * from proprietarios where senha='"+senha+"' and login='"+login+"'" );
                    String codpro = "";
                    String nprop = "";
                    while(res.next()) {
                        qtd = "1";
                        codpro = res.getString("codpro");
                        nprop = res.getString("proprietario");
                    }
                   
   
   if(qtd.equals("0"))
   {
                        out.println("<script>alert('Login e/ou Senha inválidos')</script>");   
                        out.println("<script>window.location = 'index.jsp'</script>");   
                        
   }
      
%>
                           

<%

  String prop = request.getParameter("prop")+"";
  String nome = request.getParameter("nome")+"";
  String site = request.getParameter("site")+"";
  String acao = request.getParameter("acao")+"";
        
  if(acao.equals("deletar"))
  {
        int aux = st.executeUpdate("delete from prop where codpro = "+prop+"");  
        if(prop.equals("999999"))
        {
        out.println("<script>alert('Selecione um site para remove-lo!')</script>");      
        }else{
        out.println("<script>alert('O site foi deletado com sucesso')</script>");      
        }
        
  }else{
      if(acao.equals("inserir"))
      {
        
        if((nome.equals("")) || (site.equals("")))
        {
            out.println("<script>alert('Digite o nome do site!')</script>");   
        }else{
            int aux = st.executeUpdate("insert into prop (proprietario,site,acessos) values ('"+codpro+"','"+site+"',0)");  
            out.println("<script>alert('O site foi cadastrado com sucesso')</script>");   
        }
      }    
  }

  
  
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Sites</title>
    </head>
    <body>
<font class="linkA">
<form name="f1" action="gerenciar.jsp" method="post">
    <table class="linkA"> 
        <tr>
            <td colspan="2"><b>Proprietário <%out.println(nprop);%></b></td>
        </tr>    
        <tr>
            <td>Escreva o site:</td>
            <td><input type="text" name="site"></td>
        </tr>  
        <tr>
            <td colspan="2"><input type="submit" Value="Adicionar novo site" class="linkA"></td>
        </tr>             
    </table>
    <input type="hidden" value="<%out.print(login);%>" name="login"> 
    <input type="hidden" value="<%out.print(senha);%>" name="senha"> 
     
    <input type="hidden" value="inserir" name="acao" class="linkA"> 
    
 </form>

 <form name="f2" action="gerenciar.jsp" method="post">
     <table class="linkA"> 

        <tr>
            <td>
                
                <select name="prop">
                <option value="999999">Selecione um proprietário para remove-lo</option>
                    <%
                   
                    res = st.executeQuery("Select * from prop where proprietario = "+codpro+"" );
                    while(res.next()) {
                    %>
                    <option value="<%out.println(res.getString("codpro"));%>"><% out.println(res.getString("site"));%></option>
                 
<%
                    }
                    %>
                </select>
            </td>
            <td><input type="submit" Value="Remover Site" class="linkA"></td>
        </tr>           
    </table>
    <input type="hidden" value="<%out.print(login);%>" name="login"> 
    <input type="hidden" value="<%out.print(senha);%>" name="senha"> 
    
    <input type="hidden" value="deletar" name="acao" class="linkA"> 
 </form>
 
 <a href="index.jsp">Volta ao Menu</a>
 
 <%
 st.close();
 %>
</font>
    </body>
</html>
