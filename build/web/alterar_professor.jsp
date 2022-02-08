
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>Aterar Professor</h1>
        <form method="post" action="executar_alterar_professor.jsp">
            <label for="id">id</label><br>
            <input type="text" name="id" value="<%=request.getParameter("id")%>"readonly/><br>
            <label for="nome">nome</label><br>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>"/><br>
            <label for="email">email</label><br>
            <input type="text" name="email" value="<%=request.getParameter("email")%>"/><br>
            <label for="senha">senha</label><br>
            <input type="text" name="senha" value="<%=request.getParameter("senha")%>"/><br>
            <input type="submit" value="ATUALIZAR"/>
        </form>
    </body>
</html>
