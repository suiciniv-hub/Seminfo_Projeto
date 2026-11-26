CREATE DATABASE IF NOT EXISTS seminfo
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE seminfo;

CREATE TABLE IF NOT EXISTS usuarios(
    id int auto_increment primary key,
    nome varchar(150) not null,
    idade int not null,
    email varchar(150) not null unique,
    senha_hash varchar(255) not null,
    perfil ENUM(
        'ALUNO',
        'PROFESSOR',
        'ADMIN',
        'EXTERNO'
    )   NOT NULL,
    curso varchar(150),
    matricula varchar(50),
    instituicao varchar(50)
);

CREATE TABLE IF NOT EXISTS EVENTOS(
    id int auto_increment primary key,
    titulo varchar(150) not null,
    categoria ENUM(
        'MINICURSO',
        'ATIVIDADE_OPCIONAL'
    )   NOT NULL,
    vagas int not null default 30
);

CREATE TABLE IF NOT EXISTS inscricoes(
    id int auto_increment primary key,
    usuario_id int not null unique,
    evento_id int not null,
    modalidade ENUM(
        'OUVINTE',
        'APRESENTADOR',
        'ORGANIZADOR'
    ) NOT NULL,
    foreign key (usuario_id) REFERENCES usuario(id)
    on delete cascade,
    Foreign key (evento_id) REFERENCES evento(id)
    on delete cascade
);