<?php 

class Contacts {
    private $pdo;

    public function __construct() {

        try{
            $this->pdo = new PDO("mysql:dbname=".getenv('db-dbname').";host=".getenv('db-host'),getenv('db-user'),getenv('db-password')); 
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }catch(PDOException $e) {
            echo "ERRO: ". $e->getMessage();
            exit;
        }

        return $this;
    }

    private function ckEmail(String $email, $update = false) {
        $sql = "SELECT id FROM contacts WHERE email = :email";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':email', $email);
        $sql->execute();

        if($sql->rowCount() > 0) {
            if($update) return $sql->fetch(PDO::FETCH_ASSOC)['id'];
            return true;    
        };

        return false;
    }

    public function add(String $name, String $email) {
        // 1º Verificar se o email ja existe no sistema
        if(!$this->ckEmail($email)) {
            // 2º Cadastrar
            $sql = "INSERT INTO contacts (name, email) VALUES (:name, :email)";
            $sql = $this->pdo->prepare($sql);
            $sql->bindValue(':name', ucwords(trim($name)));
            $sql->bindValue(':email', strtolower(trim($email)));
            $sql->execute();

            if($sql->rowCount() > 0 ) {
                return true;
            };
        }

        return false;
    }

    public function get(Int $id):array {
        $sql = "SELECT * FROM contacts WHERE id = :id";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':id', $id);
        $sql->execute();

        if($sql->rowCount() > 0) {
            $contact = $sql->fetch(PDO::FETCH_ASSOC);
            return $contact;
        } else {
            return array();
        };
    }

    public function getAll():array {
        $sql = "SELECT * FROM contacts";
        $sql = $this->pdo->query($sql);

        if($sql->rowCount() > 0) {
            return $sql->fetchAll(PDO::FETCH_ASSOC);
        } else {
            return array();
        };
    }

    public function update(Int $id, Array $dados) {
        // 1º Buscar os dados
        $contact = $this->get($id);
        if(!$contact) return false;

        // 2º Caso tenha passado o email, verifica se o email já não esta cadastrado
        $x = $this->ckEmail($dados['email'], true);
        if($x && $x != $contact['id']) return false;

        // 3º Altera
        $updateContact = array_merge($contact, $dados);
        $sql = "UPDATE contacts SET name = :name, email = :email WHERE id = :id";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':name', ucwords(trim($updateContact['name'])));
        $sql->bindValue(':email', strtolower(trim($updateContact['email'])));
        $sql->bindValue(':id', $updateContact['id']);
        $sql->execute();

        return ($sql->rowCount() > 0) ? true : false;

    }

    public function del($id) {
        $sql = "DELETE FROM `contacts` WHERE id = :id";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':id', $id);
        $sql->execute();

    }

}