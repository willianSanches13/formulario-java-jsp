<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="executar_inserir_professor.jsp">
            <h1>Insira os dados do professor</h1>
            <label for="nome">NOME</label><br>
            <input type="text" name="nome"/><br>
            <label for="email">EMAIL</label><br>
            <input type="text" name="email"/><br>
                <label for="senha">SENHA</label><br>
            <input type="text" name="senha"/><br>
            <button type="submit">enviar</button>
        </form>
     
    </body>
</html>
