<?php

include './config.php';
include './class/books.class.php';

$args = array();

if(isset($_GET)) {
    if(isset($_GET['p']) && !empty($_GET['p'])) {
        $args['p'] = $_GET['p'];
    };
    if(isset($_GET['qtd']) && !empty($_GET['qtd'])) {
        $args['qtd'] = $_GET['qtd'];
    };
};

$l = (new Books())->list($args);

$books      = $l['data'];
$pgs        = $l['opts']['pagination']['total_pages'];
$pg_active  = $l['opts']['pagination']['page_active'];
$osi        = $l['opts']['items']['osi']['opt'];
$osi_active = $l['opts']['items']['osi']['active'][0];
$total_items= $l['opts']['items']['total'];

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <title>BSBook</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/style.css">    
</head>
<body>
    <header class="navbar navbar-dark bg-primary">
        <nav class="container">
            <a class="navbar-brand" href="./"><strong>BS</strong>-Book</a>
        </nav>
    </header>

    <main class="container my-3">
        <div class="d-flex flex-wrap flex-sm-column flex-md-row justify-content-md-end justify-content-sm-center my-2">
            <span class="w-100 text-center d-md-none">Mostrar:</span>
            <label for="qtd" class="col-form-label mr-2 d-none d-md-inline-block">Mostrar:</label>
            <select id="qtd" class="col-6 col-md-3 col-lg-2 custom-select mx-auto mx-md-0">
                <?php foreach($osi as $v): ?>
                    <option <?php echo ($v == $osi_active) ? 'selected' : ''; ?> value="<?php echo $v ?>"> 
                        <?php echo ($v == $total_items) ? 'Todos' : $v.' por pag.' ;?>
                    </option>
                <?php endforeach;?>

            </select>
        </div>
        <div class="row">
            <table class="table table-striped table-bordered my-1 table-responsive-sm">
                <thead>
                    <tr class="bg-primary text-light">
                        <th class="text-center align-middle d-none d-md-table-cell" scope="col">#</th>
                        <th class="text-center align-middle" scope="col">Titulo</th>
                        <th class="text-center align-middle" scope="col">Autor(es)</th>
                        <th class="text-center align-middle" scope="col">Língua Original</th>
                        <th class="text-center align-middle" scope="col">Primeira Publicação</th>
                        <th class="text-center align-middle" scope="col">Vendas Aproximadas <br/> (em Milhões)</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($books as $book):?>
                    <tr>
                        <th class="text-center align-middle d-none d-md-table-cell" scope="row"><?php echo $book['id'];?></th>
                        <td class="align-middle"><?php echo $book['Titulo'];?></td>
                        <td class="align-middle"><?php echo $book['Autor(es)'];?></td>
                        <td class="text-center align-middle"><?php echo $book['Língua Original'];?></td>
                        <td class="text-center align-middle"><?php echo $book['Primeira Publicação'];?></td>
                        <td class="text-center align-middle"><?php echo $book['Vendas Aproximadas'];?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <small class="form-text text-muted">
                <strong>Fonte: </strong>
                <a target="_blank" href="https://pt.wikipedia.org/wiki/Lista_de_livros_mais_vendidos"> Wikipedia</a>
            </small>
        </div>

        <div class="row">
            <div id="pgs" class="d-flex justify-content-center flex-wrap text-center btn-group my-3 mx-auto" role="group">
                <?php for($i = 1; $i <= $pgs; $i++):?>
                    <a 
                        role='button' 
                        class='btn btn-primary text-light <?php echo ($i == $pg_active) ? 'active' : '';?>' 
                        href='./?p=<?php echo $i; ?>'
                    >
                        <?php echo $i; ?>
                    </a>
                <?php endfor; ?>
            </div>
        </div>

    </main>

    <footer class="footer mt-5 py-4 bg-dark text-light">
        <div class="container text-center">
            Developed by: <a href="https://github.com/jnetto23" target="_blanck"><strong>Jnetto23</strong></a>
        </div>
    </footer>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="./assets/js/script.js"></script>
</body>
</html>