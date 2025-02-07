drop database if exists progetto;
create database progetto;
use progetto;

create table biblioteca(
	nomeB varchar(100) NOT NULL,
    cittaCap varchar(5) NOT NULL,
    libriMax INT NOT NULL,
    libriReg INT NOT NULL,
    primary key(nomeB, cittaCap)
    );

create table libro(
	isbn varchar(13) NOT NULL,
    titolo varchar(100) not null,
    genere varchar(25) not null,
    annoPubbl int not null,
    primary key(isbn)
    );

create table autore(
	nome varchar(30) not null,
    cognome varchar(30) not null,
    nazionalita varchar(20) not null,
    primary key(nome, cognome)
    );

create table utente(
	cf varchar(16) not null,
    nome varchar(30) not null,
    cognome varchar(30) not null,
    via varchar(50) not null,
    citta varchar(20) not null,
    cap varchar(5) not null,
    dataNascita date not null,
    tipoUtente varchar(10) not null,
    professione varchar(50),
    tutoreLegale varchar(16),
    primary key(cf)
    );

create table bibliotecario(
	matricola int not null,
    nomeB varchar(100) not null,
    cittaCap varchar(5) not null,
    dataAssunzione date not null,
    durataContratto int not null,
    nome varchar(30) not null,
    ruolo varchar(50) not null,
    primary key(matricola, nomeB, cittaCap),
    foreign key(nomeB, cittaCap) references biblioteca(nomeB, cittaCap)
    );

create table collocazione(
	nomeB varchar(100) not null,
    cittaCap varchar(5) not null,
    isbn varchar(13) not null,
    primary key (nomeB, cittaCap, isbn),
	foreign key (nomeB, cittaCap) references biblioteca(nomeB, cittaCap),
    foreign key (isbn) references libro(isbn)
    );
    
create table scrittura(
	nome varchar(30) not null,
    cognome varchar(30) not null,
    isbn varchar(13) not null,
    primary key(nome, cognome, isbn),
    foreign key (nome, cognome) references autore(nome, cognome),
    foreign key (isbn) references libro(isbn)
    );
    
create table prestito(
	dataPrestito date not null,
    cf varchar(16) not null,
    isbn varchar(13) not null,
    dataRestit date not null,
    primary key(dataPrestito, cf, isbn),
    foreign key (cf) references utente (cf),
    foreign key (isbn) references libro (isbn)
    );
    
create table telefono(
	cf varchar(16) not null,
    numero varchar(10) not null,
    primary key(cf),
    foreign key(cf) references utente(cf)
    );