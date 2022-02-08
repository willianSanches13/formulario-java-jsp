
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>Aterar Disciplina</h1>
        <form method="post" action="executar_alterar_disciplina.jsp">
            <label for="id">Id</label><br>
            <input type="text" name="id" value="<%=request.getParameter("id")%>"readonly/><br>
            <label for="nome">Nome</label><br>
            <input type="text" name="nome" value="<%=request.getParameter("nome")%>"/><br>
            <label for="cargahoraria">Carga horaria</label><br>
            <input type="number" min="1" max="1000" name="cargahoraria" value="<%=request.getParameter("cargahoraria")%>"/><br>
            <input type="submit" value="ALTERAR"/>
        </form>
    </body>
</html>
