<?php
require 'db.php';

class User extends DB {
    public function __construct() {
        parent::__construct();
        return $this;
    }

    public function findById($id) {
        $arr = array();

        $sql = "SELECT * FROM tb_users WHERE id = :id";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':id', $id);
        $sql->execute();

        if($sql->rowCount() > 0) {
            $arr = $sql->fetch();
        }
        return $arr;
    }

    public function findByEmail($email) {
        $arr = array();

        $sql = "SELECT * FROM tb_users WHERE email = :email";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':email', $email);
        $sql->execute();

        if($sql->rowCount() > 0) {
            $arr = $sql->fetch();
        }
        return $arr;
    }

    public function insert($data) {
        $sql = "CALL sp_user_save(:name, :email, :pwd)";
        $sql = $this->pdo->prepare($sql);
        $sql->bindValue(':name', $data['name']);
        $sql->bindValue(':email', $data['email']);
        $sql->bindValue(':pwd', $data['pwd']);
        $sql->execute();
        if($sql->rowCount() > 0) {
            return $sql->fetch();
        }
    }
}