<?php 
require './controllers/UserController.php';

if(isset($_POST) && !empty($_POST)) {
    if(!empty($_POST['name']) && !empty($_POST['email']) && !empty($_POST['pwd'])) {
        $u = (new UserController())->signup($_POST['name'], $_POST['email'], $_POST['pwd']);
        if($u) {
            header('Location: ./index');
        } else {
            $error = 'Email já cadastrado.';
        }
    } else {
        $error = 'Por favor, preencha todos os dados.';
    };
};
?>
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
      <main>
        <form id="signup" method="POST" class="form mt-4">
            <h1 class="h3 mb-3 text-center">Cadastro</h1>
            
            <?php if(isset($error)): ?>
                <div class="alert alert-danger"><?php echo $error ?></div>
            <?php endif; ?>
            
            <div class="form-row mx-0">
                <label for="name" class="i">Nome:</label>
                <input type="text" id="name" name="name" class="form-control mb-3" data-error <?php echo (isset($_POST['name']) && !empty($_POST['name'])) ? "value='".$_POST['name'] ."'" : 'autofocus' ?>>
            </div>
            <div class="form-row mx-0">
                <label for="email" class="i">Email:</label>
                <input type="email" id="email" name="email" class="form-control mb-3" data-error <?php echo (isset($_POST['email']) && !empty($_POST['email'])) ? "value='".$_POST['email'] ."'" : '' ?>>
            </div>
            <div class="form-row mx-0">
                <label for="pwd" class="i">Senha:</label>
                <input type="password" id="pwd" name="pwd" class="form-control mb-3" data-error <?php echo (isset($_POST['pwd']) && !empty($_POST['pwd'])) ? "value='".$_POST['pwd'] ."'" : '' ?>>
            </div>
            <div class="form-row mx-0">
                <label for="pwd2" class="i">Confirmar senha:</label>
                <input type="password" id="pwd2" class="form-control mb-3" data-error <?php echo (isset($_POST['pwd']) && !empty($_POST['pwd'])) ? "value='".$_POST['pwd'] ."'" : '' ?>>
            </div>
            <div class="form-row mx-0 checkbox mb-3">
                <label class="f-14 i">
                    <input id="terms" type="checkbox" value="terms" data-error="You need to accept the terms to register" <?php echo (isset($_POST['name']) && !empty($_POST['name'])) ? 'checked' : '' ?>> 
                    Aceito os <a href="#">Termos de Uso</a> e <a href="#">Politica de Privacidade</a>    
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
            <div class="links d-flex justify-content-center">
                <span class="text-muted f-14 i">Já tem uma conta? Faça seu <a href="./signin">Login</a></span>
            </div>
        </form>
    </main>

    <footer class="footer py-4 bg-dark text-light">
        <div class="container text-center">
            &copy;Developed by: <a href="https://github.com/jnetto23" target="_blanck"><strong>Jnetto23</strong></a>
        </div>
    </footer>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="./assets/js/script.js"></script>
  </body>
</html>