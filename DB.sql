drop database if exists spotisFail;
create database spotisFail;
use spotisFail;
create table Usuario (
    idUsuario int not null AUTO_INCREMENT,
    Nombre varchar(30) not null,
    Apellidos varchar(50) not null,
    email varchar(50) not null,
    password varchar(20) not null,
    username varchar(30) not null,
    PRIMARY KEY (idUsuario)
);
insert Usuario (Nombre,Apellidos,email,password,username)values('admin','admin','admin','admin','admin');

create table Artista(
    idArtista int not null AUTO_INCREMENT,
    Nombre varchar(30) not null,
    Image varchar(50) not null,
    PRIMARY KEY (idArtista)
);
insert Artista (Nombre,Image)values ('Led Zeppelin','images/artists/ledZeppelin');
insert Artista (Nombre,Image)values ('The Rolling Stones','images/artists/rollingStones');
insert Artista (Nombre,Image)values ('The Beatles','images/artists/theBeatles');
insert Artista (Nombre,Image)values ('Eric Clapton','images/artists/ericClapton');
insert Artista (Nombre,Image)values ('Daft Punk','images/artists/daftPunk');
insert Artista (Nombre,Image)values ('Extremoduro','images/artists/extremoduro');
insert Artista (Nombre,Image)values ('Jimi Hendrix','images/artists/jimiHendrix');
insert Artista (Nombre,Image)values ('Avicii','images/artists/avici');
insert Artista (Nombre,Image)values ('Red Hot Chili Peppers','images/redHotChiliPeppers');

create table Cancion(
    idCancion int not null AUTO_INCREMENT,
    idUsuario int not null,
    idArtista int not null,
    UrlCancion varchar (40) not null,
    anio int not null,
    nombreCancion varchar(50) not null,
    genero varchar(40) not null,
    PRIMARY KEY (idCancion),
    foreign KEY (idArtista) REFERENCES Artista(idArtista)
    on delete cascade
    on update cascade,
    foreign KEY (idUsuario) REFERENCES Usuario(idUsuario)
    on delete cascade
    on update cascade
);
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,1,'music/',1971,'Starway to Heaven','Ballad-rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,1,'music/',1972,'Rock `n roll','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,2,'music/',2002,'Don´t Stop','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,2,'music/',1966,'Paint It, Back','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,3,'music/',1965,'Help','rock/pop');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,3,'music/',1968,'Jude','rock/pop');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,4,'music/',1977,'Cocacione','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,4,'music/',1992,'Tears in Heaven','Ballad-rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,5,'music/',2013,'Get Lucky','house');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,5,'music/',1997,'Around the World','house');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,6,'music/',2002,'La vereda de la puerta de atras','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,6,'music/',2011,'Si te vas...','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,7,'music/',1968,'All along the Watchtower ','rock-blues');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,7,'music/',1967,'Little Wing','rock-blues');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,8,'music/',2015,'The Nights','house');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,8,'music/',2014,'Wake Me Up','house');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,9,'music/',2010,'Californitaion','rock');
insert Cancion (idUsuario,idArtista,UrlCancion,anio,nombreCancion,genero) values(1,9,'music/',2022,'Tangelo','rock');

create table Lista(
    idLista int not null AUTO_INCREMENT,
    Nombre varchar(40) not null,
    Image varchar(50) not null,
    PRIMARY KEY (idLista)
);
insert Lista (Nombre,Image) values('Puro rock','images/lista/puroRock');
insert Lista (Nombre,Image) values('Crossfit','images/lista/crossfit');
insert Lista (Nombre,Image) values('Todooo','images/lista/todo');

create table listaCancion(
    idListaCancion int not null AUTO_INCREMENT,
    idLista int not null,
    idCancion int not null,
    PRIMARY KEY(idListaCancion),
    foreign KEY(idLista) REFERENCES Lista(idLista)
    on delete cascade
    on update cascade,
    foreign KEY(idCancion) REFERENCES Cancion(idCancion)
    on delete cascade
    on update cascade
);
insert listaCancion (idLista,IdCancion) values (1,1);
insert listaCancion (idLista,IdCancion) values (1,4);
insert listaCancion (idLista,IdCancion) values (1,7);
insert listaCancion (idLista,IdCancion) values (1,17);
insert listaCancion (idLista,IdCancion) values (1,16);
insert listaCancion (idLista,IdCancion) values (1,12);
insert listaCancion (idLista,IdCancion) values (1,10);
insert listaCancion (idLista,IdCancion) values (1,11);

insert listaCancion (idLista,IdCancion) values (2,6);
insert listaCancion (idLista,IdCancion) values (2,8);
insert listaCancion (idLista,IdCancion) values (2,2);
insert listaCancion (idLista,IdCancion) values (2,14);
insert listaCancion (idLista,IdCancion) values (2,15);

insert listaCancion (idLista,IdCancion) values (3,1);
insert listaCancion (idLista,IdCancion) values (3,2);
insert listaCancion (idLista,IdCancion) values (3,3);
insert listaCancion (idLista,IdCancion) values (3,4);
insert listaCancion (idLista,IdCancion) values (3,5);
insert listaCancion (idLista,IdCancion) values (3,6);
insert listaCancion (idLista,IdCancion) values (3,7);
insert listaCancion (idLista,IdCancion) values (3,8);
insert listaCancion (idLista,IdCancion) values (3,9);
insert listaCancion (idLista,IdCancion) values (3,10);
insert listaCancion (idLista,IdCancion) values (3,11);
insert listaCancion (idLista,IdCancion) values (3,12);
insert listaCancion (idLista,IdCancion) values (3,13);
insert listaCancion (idLista,IdCancion) values (3,14);
insert listaCancion (idLista,IdCancion) values (3,15);
insert listaCancion (idLista,IdCancion) values (3,16);
insert listaCancion (idLista,IdCancion) values (3,17);


create table listaUsuario(
    idListaUsuario int not null  AUTO_INCREMENT,
    idLista int not null,
    idUsuario int not null,
    PRIMARY KEY (idListaUsuario),
    foreign KEY (idLista) REFERENCES Lista(idLista)
    on delete cascade
    on update cascade,
    foreign KEY (idUsuario) REFERENCES Usuario(idUsuario)
    on delete cascade
    on update cascade
);

insert listaUsuario values (1,1,1);
insert listaUsuario values (2,3,1);



