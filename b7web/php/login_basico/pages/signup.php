<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <title>Cadastro</title>
  </head>
  <body>
    <form id="signup" method="POST" class="form-signin mt-4">
        <h1 class="h3 mb-3 text-center">Cadastro</h1>
        <div class="form-row">
            <label for="name" class="i">Nome:</label>
            <input type="text" id="name" class="form-control mb-3" data-error autofocus>
        </div>
        <div class="form-row">
            <label for="email" class="i">Email:</label>
            <input type="email" id="email" class="form-control mb-3" data-error>
        </div>
        <div class="form-row">
            <label for="pwd" class="i">Senha:</label>
            <input type="password" id="pwd" class="form-control mb-3" data-error>
        </div>
        <div class="form-row">
            <label for="pwd2" class="i">Confirmar senha:</label>
            <input type="password" id="pwd2" class="form-control mb-3" data-error>
        </div>
        <div class="form-row checkbox mb-3">
            <label class="f-14 i">
                <input id="terms" type="checkbox" value="terms" data-error="You need to accept the terms to register"> 
                Aceito os <a href="#">Termos de Uso</a> e <a href="#">Politica de Privacidade</a>    
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
        <div class="links d-flex justify-content-center">
            <span class="text-muted f-14 i">Já tem uma conta? Faça seu <a href="./signin">Login</a></span>
        </div>
    </form>

    <footer class="fixed-bottom">
        <p>&copy; Developet by: <a href="https://github.com/jnetto23">Jnetto23</a></p>
    </footer>



    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="./assets/js/script.js"></script>
  </body>
</html>