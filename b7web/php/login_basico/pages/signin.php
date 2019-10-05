<?php 
require './controllers/UserController.php';

if(isset($_POST) && !empty($_POST)) {
    if(!empty($_POST['email']) && !empty($_POST['pwd'])) {
        $u = (new UserController())->signin($_POST['email'], $_POST['pwd']);
        if($u) {
            header('Location: ./index');
        } else {
            $error = 'Email e/ou senha inválidos.';
        }
    } else {
        $error = 'Por favor, preencha todos os dados.';
    };
} 
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <title>Login</title>
</head>
<body>
    <form id="signin" method="POST" class="form mt-5">
        <h1 class="h3 mb-3 text-center">Login</h1>
        <?php if(isset($error)): ?>
            <div class="alert alert-danger"><?php echo $error ?></div>
        <?php endif; ?>
        
        <label for="email" class="i">Email:</label>
        <input type="email" id="email" name="email" class="form-control mb-3"data-error <?php echo (isset($_POST['email']) && !empty($_POST['email'])) ? "value='".$_POST['email'] ."'" : 'autofocus' ?>>
        <div class="d-flex justify-content-between">
            <label for="pwd" class="i">Senha:</label>
            <a class="f-14 i" href="./forgot">Recuperar Senha</a>
        </div>
        <input type="password" id="pwd" name="pwd" class="form-control mb-3" data-error>
        <button class="mt-3 btn btn-lg btn-primary btn-block" type="submit">Login</button>
        <div class="links d-flex justify-content-center">
            <span class="text-muted f-14 i">Não tem uma conta? Faça seu <a href="./signup">Cadastro</a></span>
        </div>
    </form>

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