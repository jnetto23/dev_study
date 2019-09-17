<?php 
include './config.php';
include './class/contacts.class.php';

if(isset($_GET['id']) && !empty($_GET['id'])) {
    $c = (new Contacts())->del($_GET['id']);
};

header('Location: '. BASE_URL);