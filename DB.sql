drop database if exists spotisFail;
create database spotisFail;
use spotisFail;
create table Artista(
    idArtista int not null,
    Nombre varChar(30) not null,
    Image varChar(50) not null,
    PRIMARY KEY (idArtista)
    delete on cascade,
    update on cascade
);
insert Artista values (1,'Led Zeppelin','images/artists/ledZeppelin');
insert Artista values (2,'The Rolling Stones','images/artists/rollingStones');
insert Artista values (3,'The Beatles','images/artists/theBeatles');
insert Artista values (4,'Eric Clapton','images/artists/ericClapton');
insert Artista values (5,'Daft Punk','images/artists/daftPunk');
insert Artista values (6,'Extremoduro','images/artists/extremoduro');
insert Artista values (7,'Jimi Hendrix','images/artists/jimiHendrix');
insert Artista values (8,'Avici','images/artists/avici');

create table Cancion(
    idCancion int not null,
    idArtista int not null,
    UrlCancion varChar (40) not null,
    anio int not null,
    nombreCancion varChar(30) not null,
    genero varChar(30) not null,
    PRIMARY KEY (idCancion),
    FOREGIN KEY (idArtista) REFERENCES Artista(idArtista)
    delete on cascade,
    update on cascade
);
insert Cancion values(1,1,'music/',,'Starway to Heaven','Ballad-rock');
insert Cancion values(2,1,'music/',,'Rock `n roll','rock');
insert Cancion values(3,2,'music/',,'Don´t Stop','rock');
insert Cancion values(3,2,'music/',,'Paint It, Back','rock');
insert Cancion values(4,3,'music/',,'Help','rock/pop');
insert Cancion values(5,3,'music/',,'Jude','rock/pop');
insert Cancion values(6,4,'music/',,'Cocacione','rock');
insert Cancion values(7,4,'music/',,'Tears in Heaven','Ballad-rock');
insert Cancion values(8,5,'music/',,'Get Lucky','house');
insert Cancion values(9,5,'music/',,'Around the World','house');
insert Cancion values(10,6,'music/',,'La vereda de la puerta de atras','rock');
insert Cancion values(11,6,'music/',,'Si te vas...','rock');
insert Cancion values(12,7,'music/',,'All along the ','rock-blues');
insert Cancion values(13,7,'music/',,'Traffict','rock');
insert Cancion values(14,8,'music/',,'','');
insert Cancion values(15,8,'music/',,'','');

create table Lista(
    idLista int not null,
    Nombre varChar(40) not null,
    Image varChar(50) not null,
    PRIMARY KEY (idLista)
    delete on cascade,
    update on cascade
);
create table Usuario (
    idUsuario int not null,
    Nombre varChar(30) not null,
    Apellidos varChar(50) not null,
    email varChar(50) not null,
    password varChar(20) not null,
    usurmane varChar(30) not null,
    PRIMARY KEY (idUsuario)
    delete on cascade,
    update on cascade
);
create table listaUsuario(
    idListaUsuario int not null,
    idLista int not null,
    idUsuario int not null,
    PRIMARY KEY (idListaUsuario),
    FOREGIN KEY (idLista) REFERENCES Lista(idLista),
    FOREGIN KEY (idUsuario) REFERENCES Usuario(idUsuario) 
    delete on cascade,
    update on cascade
);

insert Usuario values(1,'Roberto','Hermoso Rivero','rohermoso@alumnos.unex.es','12341234','sk-netizen');

