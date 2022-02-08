<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="executar_inserir_disciplina.jsp">
            <h1>Insira os dados da disciplina</h1>
            <label for="nome">NOME</label><br>
            <input type="text" name="nome"/><br>
             <label for="cargahoraria">CARGA HORARIA</label><br>
            <input type="number" min="1" max="1000" name="cargahoraria"/><br>
            <button type="submit">enviar</button>
        </form>
     
    </body>
</html>
