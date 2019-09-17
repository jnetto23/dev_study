DROP DATABASE IF EXISTS crud_oo;
CREATE DATABASE IF NOT EXISTS crud_oo
DEFAULT CHARSET utf8
DEFAULT COLLATE utf8_general_ci;

USE crud_oo;

DROP TABLE IF EXISTS contacts;
CREATE TABLE IF NOT EXISTS contacts(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL,
	`email` VARCHAR(100) NOT NULL UNIQUE,
    `dtRegister` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

### INSERTS DEFAULT ###
INSERT INTO `contacts`(name, email) VALUES ('Daenerys Targaryen', 'daenerys@gmail.com'), ('Jon Snow', 'jon.snow@gmail.com'), ('Arya Stark', 'arya.stark@gmail.com'), ('Tyrion Lannister', 'tyrion@gmail.com');
