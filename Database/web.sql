CREATE TABLE Ranking
 (
    id int NOT NULL PRIMARY KEY,
    Tier varchar(33),
    User VARCHAR(100),
    Point int,
    Rank int
 );
 CREATE TABLE users
 (
    Id int NOT NULL PRIMARY KEY,
    firstname  VARCHAR(100) NOT NULL,
    lastname  VARCHAR(100) NOT NULL,
    email  VARCHAR(100) NOT NULL,
    phonenumber  VARCHAR(100) NOT NULL,
    password    VARCHAR(100) NOT NULL
);

 CREATE TABLE admin
 (
    id int NOT NULL PRIMARY KEY,
    email  VARCHAR(100) NOT NULL,
    password    VARCHAR(100) NOT NULL
);



 CREATE TABLE data
 (
    id int NOT NULL PRIMARY KEY,
    title  VARCHAR(255) NOT NULL,
    content    VARCHAR(100) NOT NULL
);