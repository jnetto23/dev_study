<?php 
include './config.php';
include './class/contacts.class.php';

$list = (new Contacts())->getAll();

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
    <section>
        <div class="container my-3">
            <a href="<?php echo BASE_URL;?>addcontact.php" type="button" class="btn btn-primary mb-3">Novo Contato</a>
            <h3>Lista de Contatos</h3>
            <table class="table table-sm table-bordered table-hover ">
                <thead>
                    <tr class="text-center">
                        <th scope="col">#</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Email</th>
                        <th scope="col">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($list as $user): ?>
                    <tr>
                        <th data-Id="<?php echo $user['id']?>" class="text-center align-middle"><?php echo $user['id']?></th>
                        <td data-Name="<?php echo $user['name']?>" class="pl-3 align-middle"><?php echo $user['name']?></td>
                        <td data-Email="<?php echo $user['email']?>" class="pl-3 align-middle"><?php echo $user['email']?></td>
                        <td class="text-center align-middle">
                            <div class="btn-group">
                                <a href="<?php echo BASE_URL;?>editcontact.php?id=<?php echo $user['id'] ?>" type="button" class="btn btn-warning rounded mx-1">Editar</a>
                                <button type="button" class="btn btn-danger rounded mx-1">Excluir</button>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </section>

    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <script>
        (function(){
            window.addEventListener('load', () => {
                let btnsDel = document.querySelectorAll('button.btn-danger');
                Array.prototype.forEach.call(btnsDel, btnDel => {
                    btnDel.addEventListener('click', (e) => {
                        let tr = ((((e.target).parentNode).parentNode).parentNode);
                        let del = confirm(
                            `Tem certeza que deseja excluir o contato abaixo?
                            
                             ID: ${tr.querySelector('[data-id]').textContent}
                             NOME: ${tr.querySelector('[data-name]').textContent}
                             EMAIL: ${tr.querySelector('[data-email]').textContent}
                            `
                        );
                        
                        if(del) window.location.href = "<?php echo BASE_URL; ?>delcontact.php?id=" + tr.querySelector('[data-id]').textContent;
                    });
                });
            });
        })();
        
    </script>
  </body>
</html>