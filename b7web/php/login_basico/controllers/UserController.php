<?php

require './db/User.php';

class UserController {
    
    private $user;

    public function __construct() {
        $this->user = new User();
        return $this;
    }

    public function getUser($id) {
        return $this->user->findById($id);
    }

    public function ckLogin() {
        return (isset($_SESSION['uid']) && !empty($_SESSION['uid'])) ? $_SESSION['uid'] : false; 
    }

    public function ckEmail($email) {
        if(isset($email) && !empty($email)) {
            $email = addslashes($email);
            $u = $this->user->findByEmail($email);
            return (count($u) > 0) ? true : false;
        }
    }

    public function signin($email, $pwd) {
        if(isset($email) && !empty($email) && isset($pwd) && !empty($pwd)) {
            $email  = addslashes($email);
            $pwd    = md5(addslashes($pwd));

            $u = $this->user->findByEmail($email);
            if(count($u) > 0 && $u['pwd'] === $pwd) {
                $_SESSION['uid'] = $u['id'];
                return true;
            } 
        }
        return false;
    }

    public function logout() {
        session_destroy();
        return;
    }

    public function signup($name, $email, $pwd) {
        if(
            isset($name) && !empty($name) &&
            isset($email) && !empty($email) &&
            isset($pwd) && !empty($pwd)
        ){
            $data['name'] = addslashes($name);
            $data['email'] = addslashes($email);
            $data['pwd'] = md5(addslashes($pwd));

            $u = $this->user->insert($data);
            if(count($u) > 0 && isset($u['id'])) {
                $_SESSION['uid'] = $u['id'];
                return true;
            };
        }
        return false;
    }

    public function forgot($email) {
        if(isset($email) && !empty($email)) {
            $email = addslashes($email);
            $u = $this->user->findByEmail($email);
            if(count($u) > 0) {
                // Enviar email para redefinir a senha
            };
        }
        return;
    }

}