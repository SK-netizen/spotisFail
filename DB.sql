drop database if exists spotisFail;
create database spotisFail;
use spotisFail;
create table Artista(
    idArtista int not null,
    Nombre varchar(30) not null,
    Image varchar(50) not null,
    PRIMARY KEY (idArtista)
);
insert Artista values (1,'Led Zeppelin','images/artists/ledZeppelin');
insert Artista values (2,'The Rolling Stones','images/artists/rollingStones');
insert Artista values (3,'The Beatles','images/artists/theBeatles');
insert Artista values (4,'Eric Clapton','images/artists/ericClapton');
insert Artista values (5,'Daft Punk','images/artists/daftPunk');
insert Artista values (6,'Extremoduro','images/artists/extremoduro');
insert Artista values (7,'Jimi Hendrix','images/artists/jimiHendrix');
insert Artista values (8,'Avicii','images/artists/avici');
insert Artista values (9, 'Red Hot Chili Peppers','images/redHotChiliPeppers');

create table Cancion(
    idCancion int not null,
    idArtista int not null,
    UrlCancion varchar (40) not null,
    anio int not null,
    nombreCancion varchar(30) not null,
    genero varchar(30) not null,
    PRIMARY KEY (idCancion),
    foreign KEY (idArtista) REFERENCES Artista(idArtista)
    on delete cascade
    on update cascade
);
insert Cancion values(1,1,'music/',1971,'Starway to Heaven','Ballad-rock');
insert Cancion values(2,1,'music/',1972,'Rock `n roll','rock');
insert Cancion values(3,2,'music/',2002,'Don´t Stop','rock');
insert Cancion values(3,2,'music/',1966,'Paint It, Back','rock');
insert Cancion values(4,3,'music/',1965,'Help','rock/pop');
insert Cancion values(5,3,'music/',1968,'Jude','rock/pop');
insert Cancion values(6,4,'music/',1977,'Cocacione','rock');
insert Cancion values(7,4,'music/',1992,'Tears in Heaven','Ballad-rock');
insert Cancion values(8,5,'music/',2013,'Get Lucky','house');
insert Cancion values(9,5,'music/',1997,'Around the World','house');
insert Cancion values(10,6,'music/',2002,'La vereda de la puerta de atras','rock');
insert Cancion values(11,6,'music/',2011,'Si te vas...','rock');
insert Cancion values(12,7,'music/',1968,'All along the Watchtower ','rock-blues');
insert Cancion values(13,7,'music/',1967,'Little Wing','rock-blues');
insert Cancion values(14,8,'music/',2015,'The Nights','house');
insert Cancion values(15,8,'music/',2014,'Wake Me Up','house');
insert Cancion values(16,9,'music/',2010,'Californitaion');
insert Cancion values(17,9,'music/',2022,'Tangelo');

create table Lista(
    idLista int not null,
    Nombre varchar(40) not null,
    Image varchar(50) not null,
    PRIMARY KEY (idLista)
);
insert Lista values(1,'Puro rock','images/lista/puroRock');
insert Lista values(2,'Crossfit','images/lista/crossfit');
insert Lista values(3,'Todooo','images/lista/todo');

create table listaCancion(
    idListaCancion int not null,
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
insert listaCancion values (1,1,1);
insert listaCancion values (2,1,4);
insert listaCancion values (3,1,7);
insert listaCancion values (4,1,17);
insert listaCancion values (5,1,16);
insert listaCancion values (6,1,12);
insert listaCancion values (7,1,10);
insert listaCancion values (8,1,11);

insert listaCancion values (9,2,6);
insert listaCancion values (10,2,8);
insert listaCancion values (11,2,2);
insert listaCancion values (12,2,14);
insert listaCancion values (13,2,15);

insert listaCancion values (14,3,1);
insert listaCancion values (15,3,2);
insert listaCancion values (16,3,3);
insert listaCancion values (17,3,4);
insert listaCancion values (18,3,5);
insert listaCancion values (19,3,6);
insert listaCancion values (20,3,7);
insert listaCancion values (21,3,8);
insert listaCancion values (22,3,9);
insert listaCancion values (23,3,10);
insert listaCancion values (24,3,11);
insert listaCancion values (25,3,12);
insert listaCancion values (26,3,13);
insert listaCancion values (27,3,14);
insert listaCancion values (28,3,15);
insert listaCancion values (29,3,16);
insert listaCancion values (30,3,17);

create table Usuario (
    idUsuario int not null,
    Nombre varchar(30) not null,
    Apellidos varchar(50) not null,
    email varchar(50) not null,
    password varchar(20) not null,
    username varchar(30) not null,
    PRIMARY KEY (idUsuario)
);
insert Usuario values(1,'Roberto','Hermoso Rivero','rohermoso@alumnos.unex.es','12341234','sk-netizen');

create table listaCancionUsuario(
    idListaUsuario int not null,
    idListaCancion int not null,
    idUsuario int not null,
    PRIMARY KEY (idListaUsuario),
    foreign KEY (idListaCancion) REFERENCES listaCancion(idListaCancion)
    on delete cascade
    on update cascade,
    foreign KEY (idUsuario) REFERENCES Usuario(idUsuario)
    on delete cascade
    on update cascade
);

insert listaCancionUsuario values (1,1,1);
insert listaCancionUsuario values (2,3,1);



