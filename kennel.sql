CREATE TABLE `Location` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`address`	TEXT NOT NULL
);

CREATE TABLE `Customer` (
    `id`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `name`    TEXT NOT NULL,
    `address`    TEXT NOT NULL,
    `email`    TEXT NOT NULL,
    `password`    TEXT NOT NULL
);

CREATE TABLE `Animal` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`  TEXT NOT NULL,
	`status` TEXT NOT NULL,
	`breed` TEXT NOT NULL,
	`customer_id` INTEGER NOT NULL,
	`location_id` INTEGER,
	FOREIGN KEY(`customer_id`) REFERENCES `Customer`(`id`),
	FOREIGN KEY(`location_id`) REFERENCES `Location`(`id`)
);


CREATE TABLE `Employee` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT NOT NULL,
	`address`	TEXT NOT NULL,
	`location_id` INTEGER NOT NULL,
	FOREIGN KEY(`location_id`) REFERENCES `Location`(`id`)

);


SELECT
    a.id,
    a.name,
    a.breed,
    a.status,
    a.location_id,
    a.customer_id,
    l.name location_name,
    l.address location_address,
	c.name customer_name
FROM Animal a
JOIN Location l
    ON l.id = a.location_id
JOIN Customer c 
	ON c.id = a.customer_id
