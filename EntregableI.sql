-- Creacion de la base de datos: blog_db para gestionar un Blog
create database blog_db;

-- Creacion de la tabla: users

create table users (
		id serial primary key,
		first_name varchar(50),
		last_name varchar(50),
		email varchar(100)
);

-- consultando la tabla users creada.
select * from users;

-- Insert de 3 usuarios en la tabla users

insert into users (first_name,last_name, email)
values 
('Karen', 'Moreno', 'karenmoreno674@gmail.com'),
('Nairobi', 'Garcia', 'Nairobigarcia@gmail.com'),
('Andres', 'Da Silva', 'Andres@gmail.com');

-- Creacion de la tabla posts

create table posts (
		id serial primary key,
		title varchar(50), 
		text varchar(255),
		creator_id int references users(id)
);

-- consultando la tabla users creada.

select * from posts;

-- Insert de 5 posts en la tabla posts

insert into posts (title,text, creator_id)
values
('El mejor blog de programacion','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat',1),
('El blog mas educativo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat',2),
('Este blog es muy nutritivo','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat',3),
('El blog con la informacion mas clara','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat',1),
('El blog que me ayuda a crecer','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi placerat',2);

-- Creando la tabla likes

create table likes (
		id serial primary key,
		user_id int references users(id), 
		post_id int references posts(id)
);

-- consultando la tabla users creada.

select * from likes;

-- Insert de 5 like 

insert into likes (user_id, post_id)
values 
(1,1),
(3,2),
(2,3),
(3,4),
(2,5);

-- Query para consultar todos los post y la inf del usuario. 

select 
	p.id,
	p.title,
	p.text,
	u.first_name,
	u.last_name,
	u.email
from posts p
inner join users u
	on p.creator_id=u.id;
	
-- Query que trae todos los post, con la inf de los users que le dieron like

select 
	u.id, 
	u.first_name,  
	u.last_name, 
	u.email, 
	p.title, 
	p.text description
from users u
inner join likes l 
	on u.id=l.user_id
inner join posts p 
	on p.id=l.post_id;
