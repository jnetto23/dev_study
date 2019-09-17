<?php 
include './config.php';
include './class/contacts.class.php';

$error = '';

if(isset($_POST['name']) && isset($_POST['email'])) {
    if(!empty($_POST['name']) && !empty($_POST['email'])) {
        $c = (new Contacts())->add($_POST['name'], $_POST['email']);
        if($c) {
            header('Location: '. BASE_URL);
        } else {
            $error = 'Email ja cadastrado.';    
        };
    } else {
        $error = 'Por favor, preencha todos os dados.';
    };
} 

?>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <!-- Meta tags Obrigatórias -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>CRUD OO</title>
  </head>
  <body>
    <header>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container">
                <span class="navbar-brand mb-0 h1">CRUD OO</span>
            </div>
        </nav>
    </header>
    <section id="add">
        <div class="container my-3">
            <h3>Adicionar Novo Contato</h3>
            <div class="col-12 col-md-6 px-0 my-3">
                
                <?php if(isset($error) && !empty($error)):?>
                <div class="alert alert-danger my-2" role="alert">
                    <?php echo $error; ?>
                </div>
                <?php endif; ?>
                
                <form method="POST">
                    <div class="form-group">
                        <label for="name">Nome</label>
                        <input type="text" class="form-control" id="name" name="name" value="<?php echo (!empty($_POST['name']))? $_POST['name'] : '';?>">
                    </div>
                    <div class="form-group">
                        <label for="email">Email: </label>
                        <input type="email" class="form-control" id="email" name="email" value="<?php echo (!empty($_POST['email']))? $_POST['email'] : '';?>">
                    </div>
                    <div class="d-flex justify-content-between">
                        <input type="submit" class="btn btn-success rounded" value="Cadastrar">
                        <a href="<?php echo BASE_URL;?>" type="button" class="btn btn-danger rounded">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script>
        document.querySelector('input[name=name]').focus();
    </script>
  </body>
</html>