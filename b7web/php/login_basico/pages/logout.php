<?php

require './controllers/UserController.php';
$l = (new UserController())->logout();
header('Location: ./signin');