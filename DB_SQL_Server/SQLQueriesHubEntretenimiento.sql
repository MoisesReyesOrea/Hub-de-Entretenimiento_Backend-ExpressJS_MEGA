use HubDeEntretenimientoMEGA

-- creación de entidad 'users'
create table users (
	user_id int identity(1,1) not null,
	name varchar(25) not null,
	last_name varchar(25) not null,
	second_last_name varchar(25),
	email varchar(30) not null,
	password varchar(20) not null,
	age tinyint,
	nationality varchar(50),
	profile_photo varbinary(max),
	premium bit,

	-- restricciones entidad 'users'
	constraint Pk_user primary key (user_id asc),
	constraint UQ_user unique (email),
	constraint CK_age_no_negative check (age > 0)
)

-- creación de entidad 'movies'
create table movies (
	movie_id int identity(1,1) not null,
	title varchar(50) not null,
	date varchar(10) not null,
	duration varchar(20) not null,
	description varchar(1000) not null,
	cover_img varbinary(max),
	video_url varchar(1000),
	media_type varchar(20),

	-- restricciones entidad 'movies'
	constraint PK_movie primary key (movie_id asc),
	constraint UQ_movie unique (title, date, description)
)


-- creación de tabla 'sports'
create table sports (
	sport_id int identity(1,1) not null,
	title varchar(50) not null,
	date varchar(50) not null,
	duration varchar(20) not null,
	description varchar(1000) not null,
	cover_img varbinary(max),
	video_url varchar(1000),
	media_type varchar(20),

	-- restricciones entidad 'sports'
	constraint PK_sport primary key (sport_id asc),
	constraint UQ_sport unique (title, date, description),

)

-- creación de tabla 'series'
create table series (
	serie_id int identity(1,1) not null,
	title varchar(30) not null,
	date varchar(30) not null,
	description varchar(1000) not null,
	cover_img varbinary(max),
	--num_seasons smallint,
	--num_episodes smallint,

	-- restriciones entidad 'series'
	constraint PK_series primary key (serie_id asc),
	constraint UQ_serie unique (title, date, description)
)

-- creación entidad 'serie_seasons'
create table serie_seasons (
	season_id int identity(1,1) not null,
	serie_id int not null,
	title varchar(30) not null,
	date varchar(30) not null,
	description varchar(1000) not null,
	cover_img varbinary(max),

	-- restricciones entidad 'serie_season'
	constraint PK_season primary key (season_id),
	constraint FK_serie foreign key (serie_id) references series(serie_id),
	constraint UQ_season unique (title, date, description),
)

-- creación entidad 'serie_episodes'
create table serie_episodes (
	episode_id int identity(1,1) not null,
	season_id int not null,
	title varchar(30) not null,
	episode_number smallint not null unique,
	date varchar(30) not null,
	duration varchar(20) not null,
	description varchar(1000) not null,
	cover_img varbinary(max),
	video_url varchar(1000),
	media_type varchar(20),

	--restricciones entidad 'serie_episodes'
	constraint PK_episode primary key (episode_id),
	constraint FK_season foreign key (season_id) references serie_seasons(season_id),
	constraint UQ_episode unique (title, date, description)
)


-- creación de entidad 'favorites'
create table favorites (
	favorite_id int identity(1,1) not null,
	user_id int not null,
	movie_id int,
	serie_id int,
	sport_id int,
	created_at timestamp,

	-- restricciones entidad 'favorites'
	constraint PK_favorite primary key (favorite_id asc),
	constraint FK_favorite_user foreign key (user_id) references users(user_id),
	constraint FK_favorite_movie foreign key (movie_id) references movies(movie_id),
	constraint FK_favorite_serie foreign key (serie_id) references series(serie_id),
	constraint FK_favorite_sport foreign key (sport_id) references sports(sport_id),
	constraint UQ_favoriteUniq unique (user_id, movie_id, serie_id, sport_id),

	CONSTRAINT chk_multimedia_unique CHECK (
        (movie_id IS NOT NULL AND serie_id IS NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NOT NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NULL AND sport_id IS NOT NULL)
    )
) 

-- creación de entidad 'history'
create table history (
	history_id int identity(1,1) not null,
	user_id int not null,
	movie_id int,
	serie_id int,
	sport_id int,
	created_at timestamp,

	-- restricciones entidad 'history'
	constraint PK_history primary key (history_id asc),
	constraint FK_history_user foreign key (user_id) references users(user_id),
	constraint FK_history_movie foreign key (movie_id) references movies(movie_id),
	constraint FK_history_serie foreign key (serie_id) references series(serie_id),
	constraint FK_history_sport foreign key (sport_id) references sports(sport_id),
	constraint UQ_historyUniq unique (user_id, movie_id, serie_id, sport_id),

	CONSTRAINT chk_history_unique CHECK (
        (movie_id IS NOT NULL AND serie_id IS NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NOT NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NULL AND sport_id IS NOT NULL)
    )
) 

-- creación de entidad 'hiddens'
create table hiddens (
	hidden_id int identity(1,1) not null,
	user_id int not null,
	movie_id int,
	serie_id int,
	sport_id int,
	created_at timestamp,

	-- restricciones entidad 'hiddens'
	constraint PK_hidden primary key (hidden_id asc),
	constraint FK_hidden_user foreign key (user_id) references users(user_id),
	constraint FK_hidden_movie foreign key (movie_id) references movies(movie_id),
	constraint FK_hidden_serie foreign key (serie_id) references series(serie_id),
	constraint FK_hidden_sport foreign key (sport_id) references sports(sport_id),
	constraint UQ_hiddenUniq unique (user_id, movie_id, serie_id, sport_id),

	CONSTRAINT chk_hidden_unique CHECK (
        (movie_id IS NOT NULL AND serie_id IS NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NOT NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NULL AND sport_id IS NOT NULL)
    )
) 

-- creación de entidad 'directors'
create table directors (
	director_id int identity(1,1) not null,
	name varchar(25) not null,
	last_name varchar(25) not null,
	age tinyint,
	nationality varchar(50),
	profile_photo varbinary(max),

	-- restricciones entidad 'director'
	constraint Pk_director primary key (director_id asc),
	constraint UQ_director unique (name, last_name, age),
	constraint CK_age_no_negative_director check (age > 0)
)

-- creación de entidad 'actors'
create table actors (
	actor_id int identity(1,1) not null,
	name varchar(25) not null,
	last_name varchar(25) not null,
	age tinyint,
	nationality varchar(50),
	profile_photo varbinary(max),

	-- restricciones entidad 'actors'
	constraint Pk_actor primary key (actor_id asc),
	constraint UQ_actor unique (name, last_name, age),
	constraint CK_age_no_negative_actor check (age > 0)
)

-- creacion de entidad 'genres'
create table genres (
	genre_id int identity(1,1) not null,
	genre_name varchar(30),

	-- restricciones entidad 'genre'
	constraint PK_genre primary key (genre_id asc),
	constraint UQ_genre unique (genre_name)
)

-- creación de entidad 'multimedia_directors'
create table multimedia_directors (
	multimedia_director_id int identity(1,1) not null,
	director_id int not null,
	movie_id int,
	serie_id int,
	sport_id int,

	-- restricciones entidad 'multimedia_directors'
	constraint PK_multimedia_director primary key (multimedia_director_id asc),
	constraint FK_multimedia_director foreign key (director_id) references directors(director_id),
	constraint FK_multimedia_movie_d foreign key (movie_id) references movies(movie_id),
	constraint FK_multimedia_serie_d foreign key (serie_id) references series(serie_id),
	constraint FK_multimedia_sport_d foreign key (sport_id) references sports(sport_id),
	constraint UQ_multimedia_directorUniq unique (director_id, movie_id, serie_id, sport_id),

	CONSTRAINT chk_multimedia_director_unique CHECK (
        (movie_id IS NOT NULL AND serie_id IS NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NOT NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NULL AND sport_id IS NOT NULL)
    )
) 

-- creación de entidad 'multimedia_actors'
create table multimedia_actors (
	multimedia_actor_id int identity(1,1) not null,
	actor_id int not null,
	movie_id int,
	serie_id int,
	sport_id int,

	-- restricciones entidad 'multimedia_actors'
	constraint PK_multimedia_actor primary key (multimedia_actor_id asc),
	constraint FK_multimedia_actor foreign key (actor_id) references actors(actor_id),
	constraint FK_multimedia_movie_a foreign key (movie_id) references movies(movie_id),
	constraint FK_multimedia_serie_a foreign key (serie_id) references series(serie_id),
	constraint FK_multimedia_sport_a foreign key (sport_id) references sports(sport_id),
	constraint UQ_multimedia_actorUniq unique (actor_id, movie_id, serie_id, sport_id),

	CONSTRAINT chk_multimedia_actor_unique CHECK (
        (movie_id IS NOT NULL AND serie_id IS NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NOT NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NULL AND sport_id IS NOT NULL)
    )
) 

-- creación de entidad 'multimedia_genres'
create table multimedia_genres (
	multimedia_genre_id int identity(1,1) not null,
	genre_id int not null,
	movie_id int,
	serie_id int,
	sport_id int,

	-- restricciones entidad 'multimedia_genres'
	constraint PK_multimedia_genre primary key (multimedia_genre_id asc),
	constraint FK_multimedia_genre foreign key (genre_id) references genres(genre_id),
	constraint FK_multimedia_movie_g foreign key (movie_id) references movies(movie_id),
	constraint FK_multimedia_serie_g foreign key (serie_id) references series(serie_id),
	constraint FK_multimedia_sport_g foreign key (sport_id) references sports(sport_id),
	constraint UQ_multimedia_genreUniq unique (genre_id, movie_id, serie_id, sport_id),

	
	CONSTRAINT chk_multimedia_unique_genre CHECK (
        (movie_id IS NOT NULL AND serie_id IS NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NOT NULL AND sport_id IS NULL) OR
        (movie_id IS NULL AND serie_id IS NULL AND sport_id IS NOT NULL)
    )
)

-- Visualización de las entidades creadas
select * from users
select * from movies
select * from sports
select * from series
select * from serie_seasons
select * from serie_episodes
select * from favorites

-- Insertando datos en tabla 'users'
insert into users (name, last_name, second_last_name, email, password, age, nationality, premium)
values ('Moisés', 'Reyes','Orea', 'moises@gmail.com', '123456', 30, 'Mexican', 0)

insert into users (name, last_name, second_last_name, email, password, age, nationality, premium)
values ('Julio', 'Martinez','Hernandez', 'julio@gmail.com', '654321', 25, 'Mexican', 0)

insert into users (name, last_name, second_last_name, email, password, age, nationality, premium)
values ('Carlos', 'Mendoza','Perez', 'carlos-perez@gmail.com', '90120928', 25, 'Mexican', 0)

insert into users (name, last_name, second_last_name, email, password, age, nationality, premium)
values ('Carlos', 'Hernandez','Perez', 'carlos-hernandez@gmail.com', '90120928', 25, 'Mexican', 0)


-- insertando datos en tabla movie
insert into movies (title, date, description, media_type, duration)
values ('Avatar 2', '2022', 'Jake Sully y Ney tiri han formado una familia y hacen todo lo posible por permanecer juntos. Sin embargo, deben abandonar su hogar y explorar las regiones de Pandora cuando una antigua amenaza reaparece.', 'movie', '3h 12m')

insert into movies (title, date, description, media_type, duration)
values ('Deadpool 3', '2024', 'Lobezno se recupera de sus heridas cuando se cruza con el bocazas, Deadpool, que ha viajado en el tiempo para curarlo con la esperanza de hacerse amigos y formar un equipo para acabar con un enemigo común.', 'movie', '2h 7m')

insert into movies (title, date, description, media_type, duration)
values ('Oppenheimer', '2023', 'Durante la Segunda Guerra Mundial, el teniente general Leslie Groves designa al físico J. Robert Oppenheimer para un grupo de trabajo que está desarrollando el Proyecto Manhattan, cuyo objetivo consiste en fabricar la primera bomba atómica.', 'movie', '3 horas')

insert into movies (title, date, description, media_type, duration)
values ('El Hobbit: La batalla de los cinco ejércitos', '2014', 'Mientras Smaug lanza su ira ardiente contra los ciudadanos de la Ciudad del Lago, Sauron envía legiones de orcos a atacar la Montaña Solitaria. La Tierra está en peligro cuando hombres, enanos y elfos deben decidir si se unen o son destruidos.', 'movie', '2h 24m')

insert into movies (title, date, description, media_type, duration)
values ('Furiosa: de la saga Mad Max', '2024', 'La joven Furiosa es arrebatada del Paraje Verde de las Muchas Madres por una horda de motociclistas. El señor de la guerra que dirige su grupo se enfrenta a otro tirano y, mientras tanto, Furiosa aprovecha la batalla para intentar volver a casa.', 'movie', '2h 28m')


-- insertando datos en tabla series
insert into series (title, date, description)
values ('La Casa del Dragón','2022','La historia de la familia Targaryen, 200 años antes de los eventos que tuvieron lugar en Game of Thrones.')


-- insertando datos en tabla serie-seasons
insert into serie_seasons (serie_id, title, date, description)
values (1, 'Temporada 1', '2022', 'La primera temporada de La casa del dragón nos pone en contexto de una anunciada Guerra Civil por la herencia del Trono de Hierro. El Rey Viserys muere y son muchos los que quieren el trono.')

insert into serie_seasons (serie_id, title, date, description)
values (1, 'Temporada 2', '2024', 'Westeros está al borde de una sangrienta guerra civil entre los Consejos Verde y Negro luchando por el Rey Aegon y la Reina Rhaenyra respectivamente. Cada lado cree que le corresponde el Trono de Hierro')


-- insertando datos en tabla serie-episodes
insert into serie_episodes (episode_number, season_id, title, date, duration, description, media_type)
values (1, 1, 'Los herederos del dragón', '21 de agosto de 2022', '1 h 3 min', 'Durante el antiguo reinado de Jaehaerys Targaryen, las tragedias acabaron con la vida de sus hijos, dejando su sucesión indecisa. El Gran Consejo se reúne para definir la sucesión y el futuro de Westeros. La nieta de Jaehaerys, la princesa Rhaenys Targaryen y el príncipe Viserys Targaryen (primo de Rhaenys) son los candidatos. Por costumbre y precedente, Westeros debe inclinar la balanza hacia un heredero varón por sobre una mujer, independientemente del orden de nacimiento, por lo que se elige a Viserys como sucesor del trono.', 'episode' )

insert into serie_episodes (episode_number, season_id, title, date, duration, description, media_type)
values (2, 1, 'El príncipe canalla', '28 de agosto de 2022', '52min', 'Seis meses después de que Rhaenyra fuera nombrada heredera, Daemon ocupa ilegalmente Rocadragón, apoyado por los guardias leales de la Guardia de la Ciudad. Cuando el príncipe Craghas Drahar, conocido como el Alimentador de Cangrejos, amenaza Peldaños de Piedra a distancia de la Triarquía, la sugerencia de Rhaenyra de mostrar fuerza es descartada por el Consejo. A cambio, está relegada a nombrar un nuevo caballero de la Guardia Real.', 'episode' )

insert into serie_episodes (episode_number, season_id, title, date, duration, description, media_type)
values (3, 1, 'El segundo de su nombre', '04 de septiembre de 2022', '1h', 'Durante tres años, los conflictos en la región de Peldaños de Piedra se han intensificado significativamente. lord Corlys y el príncipe Daemon luchan contra Craghas Dahar y sus piratas sin el apoyo de la Corona, quien permanece neutral. El rey Viserys y reina Alicent, quien está embarazada, planean una gran cacería para celebrar el segundo cumpleaños de su hijo Aegon. La relación entre Rhaenyra y Viserys se ve manchada debido a la insistencia del rey de que Rhaenyra se case para formar una alianza fuerte y proteger su linaje.', 'episode' )

insert into serie_episodes (episode_number, season_id, title, date, duration, description, media_type)
values (1, 3, 'Hijo por hijo', '16 de junio de 2024 ', '58min', 'Mientras Rhaenyra lucha por aceptar el asesinato de su hijo, en Desembarco del Rey, a Alicent le preocupa que el Pequeño Consejo de Aegon pueda llevarlos a una guerra total. Larys sugiere que Aegon necesita una nueva mano y Rhaenyra toma una decisión fatídica.', 'episode' )

insert into serie_episodes (episode_number, season_id, title, date, duration, description, media_type)
values (2, 3, 'Rhaenyra la Cruel', '23 de junio de 2024', '1 h 9 min', 'Mientras Otto planea poner al público en su contra, Rhaenyra cuestiona la lealtad de Daemon. Mientras tanto, Ser Criston Cole inventa un plan equivocado de venganza.', 'episode' )

insert into serie_episodes (episode_number, season_id, title, date, duration, description, media_type)
values (3, 3, 'El molino en llamas', '30 de junio de 2024', '1 h 6 min', 'Los Bracken y los Blackwood se enfrentan brutalmente y queman un molino en las Tierras de los Ríos. Mientras entierran a Erryk y Arryk, Rhaenys le sugiere a Rhaenyra que Alicent puede entrar en razón y así evitar la guerra. Criston propone un plan audaz para conquistar Harrenhal, pero Daemon llega allí primero y le juran lealtad.', 'episode' )

-- insertando datos en tabla favorites
insert into favorites (user_id, movie_id)
values ('1', '7')
insert into favorites (user_id, movie_id)
values ('1', '2')

-- modificando atributos de elementos en tabla movies
update movies set media_type = 'movie', duration = '3h 12m' 
where title = 'Avatar 2'

update movies set duration = '2h 7m' 
where title = 'Deadpool 3'

update movies set duration = '3 horas' 
where title = 'Oppenheimer'

-- eliminando tabla sport
drop table sports;

-- Consulta para obtener las temporadas de una serie específica
SELECT ss.*
FROM serie_seasons ss
JOIN series s ON ss.serie_id = s.serie_id
WHERE s.serie_id = 1;

-- Consulta para obtener los episodios de una temporada específica
SELECT se.*
FROM serie_episodes se
JOIN serie_seasons ss ON se.season_id = ss.season_id
WHERE ss.season_id = 3;