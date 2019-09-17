<?php

class Books {

    private $pdo;

    public function __construct() {
        try{
            $this->pdo = new PDO("mysql:dbname=".getenv('db-dbname').";host=".getenv('db-host').";charset=utf8",getenv('db-user'),getenv('db-password')); 
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES UTF8");
        }catch(PDOException $e) {
            echo "ERRO: ". $e->getMessage();
            exit;
        }

        return $this;
    }

    private function intArgs($arg, $default) {
        $arg = intval(addslashes($arg));
        return ($arg == 0) ? $default : $arg;
    }

    public function list($params = array()) {
        $array = array();
        $args = array();
        $args_default = array('p' => 1, 'qtd' => intval(getenv('qtd-items-default-per-page')));
        
        if(!empty($params['p'])) $args['p'] = $this->intArgs($params['p'], $args_default['p']);
        if(!empty($params['qtd'])) $args['qtd'] = $this->intArgs($params['qtd'], $args_default['qtd']);
                
        $args = array_merge($args_default, $args);
        
        $sql = 'SELECT COUNT(`id`) as C FROM books';
        $sql = $this->pdo->query($sql);
        $total_books = intval($sql->fetch(PDO::FETCH_ASSOC)['C']);

        $args['p'] = ($args['p'] > ceil($total_books/$args['qtd'])) ? ceil($total_books/$args['qtd']) : $args['p']; 
        $args['init'] = ($args['p'] - 1) * $args['qtd'];
        
        $array['opts'] = $this->opts($args['qtd'], $total_books, $args['p']);

        $sql = 'SELECT 
                    b.id, 
                    b.title as `Titulo`, 
                    b.originalLanguage as `Língua Original`, 
                    b.firstPost as `Primeira Publicação`,
                    b.approximateSales as `Vendas Aproximadas`,
                    a.name as `Autor(es)`  
                FROM 
                    books b
                INNER JOIN 
                    authors a 
                ON 
                    b.id_author = a.id
                LIMIT :i, :qtd';
        
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(":i", intval($args['init']), PDO::PARAM_INT);
        $sql->bindValue(":qtd", intval($args['qtd']), PDO::PARAM_INT);
        $sql->execute();

        if($sql->rowCount() > 0) {
            $array['data'] = $sql->fetchAll(PDO::FETCH_ASSOC);
        };

        return $array;

    }

    private function opts($qtd_active, $total_items, $p) {
        $array['items']['per_page_default'] = intval(getenv('qtd-items-default-per-page'));
        $array['items']['per_page'] = $qtd_active;
        $array['items']['total'] = $total_items;
        $array['items']['osi'] = $this->optShowItems(
            $array['items']['per_page_default'], $total_items, 4, $qtd_active
        );

        $array['pagination']['page_active'] = $p;
        $array['pagination']['total_pages'] = ceil($total_items/$qtd_active);
        
        return $array;
    }

    private function optShowItems($default, $total, $qtd, $active) {
        $array = array('opt' => array(), 'active' => array());
        array_push($array['opt'], $default);
        for($i=2; $i<($qtd+2); $i++) {
            array_push($array['opt'], ($default * $i));
        }
        array_push($array['opt'], $total);
        array_push($array['active'], $active);
        return $array;
    }
}