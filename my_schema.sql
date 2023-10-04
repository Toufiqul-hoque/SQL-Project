SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


CREATE DATABASE sakila;

USE sakila;

CREATE TABLE actor(
actor_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (actor_id),
KEY idx_actor_last_name (last_name)
);



CREATE TABLE address (
address_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
address VARCHAR (50) NOT NULL,
address2 VARCHAR (50) DEFAULT NULL,
district VARCHAR (20) NOT NULL, 
city_id SMALLINT UNSIGNED NOT NULL, 
postal_code VARCHAR (10) DEFAULT NULL,
phone VARCHAR (20) NOT NULL,
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (address_id),
KEY idx_fk_city_id (city_id),
CONSTRAINT `fk_address_city` FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE category (
category_id TINYINT (3) UNSIGNED NOT NULL AUTO_INCREMENT,
NAME VARCHAR (25) NOT NULL, 
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (category_id)
);

CREATE TABLE city (
city_id SMALLINT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
city VARCHAR (50) NOT NULL, 
country_id SMALLINT (5) UNSIGNED NOT NULL,
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (city_id),
KEY idx_fk_city1_id (country_id),
CONSTRAINT `fk_city1_city` FOREIGN KEY (country_id) REFERENCES country (country_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE country (
country_id SMALLINT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
country VARCHAR (50) NOT NULL, 
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (country_id)
);


CREATE TABLE customer(
customer_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
store_id TINYINT (3) UNSIGNED NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
email VARCHAR (50) NULL,
address_id SMALLINT (5) UNSIGNED NOT NULL,
active TINYINT (1) NOT NULL DEFAULT 1,
create_date DATETIME NOT NULL, 
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (customer_id),
KEY idx_fk_store (store_id),
KEY idx_fk_customer_last_name (last_name),
KEY idx_fk_address_id (address_id),
CONSTRAINT `fk_store` FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_address` FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE film(
film_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
title VARCHAR(128) NOT NULL,
description TEXT NULL,
release_year YEAR (4) NULL,
language_id TINYINT (3) UNSIGNED NOT NULL,
original_language_id TINYINT (3) UNSIGNED NULL,
rental_duration TINYINT (3) UNSIGNED NULL DEFAULT 3,
rental_rate DECIMAL (4,2) NULL DEFAULT 4.99,
length SMALLINT (5) UNSIGNED NULL, 
replacement_cost DECIMAL (5,2) NULL DEFAULT 19.99,
rating ENUM ('G', 'PG','PG-13', 'R', 'NC-17') NULL DEFAULT 'G',
special_features SET ('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') NULL, 
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (film_id),
KEY idx_fk_title (title),
KEY idx_fk_language_id (language_id),
KEY idx_fk_original_language_id (original_language_id),
CONSTRAINT `fk_language` FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_original_language` FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE `film_actor` (
	`actor_id` SMALLINT(5) UNSIGNED NOT NULL,
	`film_id` SMALLINT(5) UNSIGNED NOT NULL,
	`last_update` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`actor_id`, `film_id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;








CREATE TABLE `film_category` (
	`film_id` SMALLINT(5) UNSIGNED NOT NULL,
	`category_id` TINYINT(3) UNSIGNED NOT NULL,
	`last_update` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`film_id`, `category_id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=INNODB
;




CREATE TABLE film_text(
film_id SMALLINT(5) UNSIGNED NOT NULL,
title VARCHAR (255) NOT NULL,
description TEXT NULL, 
PRIMARY KEY (film_id),
FULLTEXT KEY (title,description)
);

CREATE TABLE language(
language_id TINYINT (3) UNSIGNED NOT NULL AUTO_INCREMENT,
name CHAR (20) NULL,
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (language_id)
);


CREATE TABLE `inventory` (
	`inventory_id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
	`film_id` SMALLINT(5) UNSIGNED NOT NULL,
	`store_id` TINYINT(3) UNSIGNED NOT NULL,
	`last_update` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
	PRIMARY KEY (`inventory_id`) USING BTREE,
	INDEX `idx_fk_film` (`film_id`) USING BTREE,
	INDEX `idx_fk_store_id` (`store_id`) USING BTREE,
	CONSTRAINT `fk_film_id` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT `fk_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON UPDATE CASCADE ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;





CREATE TABLE payment(
payment_id SMALLINT (5) UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id SMALLINT (5) UNSIGNED NOT NULL,
staff_id TINYINT (3) UNSIGNED NOT NULL, 
rental_id INT (11) UNSIGNED NULL, 
amount DECIMAL (5,2),
payment_date DATETIME, 
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (payment_id),


KEY idx_fk_customer_id (customer_id),
KEY idx_fk_staff_id (staff_id),
KEY idx_fk_rental_id (rental_id),

CONSTRAINT `fk_customer_id` FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_staff_id` FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_rental_id` FOREIGN KEY (rental_id) REFERENCES rental (rental_id) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE rental(
rental_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
rental_date DATETIME NOT NULL,
inventory_id MEDIUMINT (8) UNSIGNED NOT NULL, 
customer_id SMALLINT (5) UNSIGNED NOT NULL, 
renturn_date DATETIME NULL, 
staff_id TINYINT (3) UNSIGNED NOT NULL,
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (rental_id),


KEY idx_fk_customer_id1 (customer_id),
KEY idx_fk_inventory_id (inventory_id),
KEY idx_fk_rental_date1 (rental_date),
KEY idx_fk_staff_id1 (staff_id),



CONSTRAINT `fk_customer_id1` FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_staff_id1` FOREIGN KEY (staff_id) REFERENCES staff (staff_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_inventory_id` FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id) ON DELETE RESTRICT ON UPDATE CASCADE
);





CREATE TABLE staff(
staff_id TINYINT (3) UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR (45) NOT NULL,
last_name VARCHAR (45) NOT NULL,
address_id SMALLINT (5) UNSIGNED NOT NULL, 
picture BLOB NULL,
email VARCHAR (50) NULL,
store_id TINYINT (3) UNSIGNED NOT NULL, 
active TINYINT (1) NULL DEFAULT 1,
username VARCHAR (16) NOT NULL,
password VARCHAR (40) NULL,
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (staff_id),


KEY idx_fk_address_id2 (address_id),
KEY idx_fk_store_id2 (store_id),



CONSTRAINT `fk_address_id2` FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_store_id2` FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE RESTRICT ON UPDATE CASCADE
);



CREATE TABLE store(
store_id TINYINT (3) UNSIGNED NOT NULL AUTO_INCREMENT,
manager_staff_id TINYINT (3) UNSIGNED NOT NULL,
address_id SMALLINT (5) UNSIGNED NOT NULL, 
last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

PRIMARY KEY (store_id),
UNIQUE KEY (manager_staff_id),

KEY idx_fk_address_id3 (address_id),



CONSTRAINT `fk_manager_staff_id` FOREIGN KEY (manager_staff_id) REFERENCES staff (staff_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT `fk_address_id3` FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
