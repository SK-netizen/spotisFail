drop database if exists spotisFail;
create database spotisFail;
use spotisFail;
create table Usuario (
    idUsuario int not null,
    Nombre varChar(30) not null,
    Apellidos varChar(50) not null,
    email varChar(50) not null,
    password varChar(20) not null,
    usurmane varChar(30) not null,
    PRIMARY KEY (idUsuario)
);

insert Usuario values(1,'Roberto','Hermoso Rivero','rohermoso@alumnos.unex.es','12341234','sk-netizen');
