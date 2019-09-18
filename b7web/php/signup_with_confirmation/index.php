<?php

require __DIR__."/vendor/autoload.php";

use Fyyb\Support\Email;

$email = new Email();
$email->add(
    "Hello",
    "<h1> Olá Mundo </h1>",
    "Joao Marques Netto",
    "j.netto@outlook.com"
)->send();

if(!$email->error()) {
    var_dump(true);
} else {
    echo $email->error()->getMessage();
}