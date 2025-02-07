use progetto;

-- 1. Mostrare gli utenti nati prima del 2000, residenti a roma o napoli. Ordina per nome.
-- (CF, nome utente, cognome utente)

select cf, nome, cognome
from utente
where (citta = 'Napoli' or citta = 'Roma') and year(datanascita) < 2000
order by nome desc;

-- 2. Gli utenti che hanno preso in prestito un libro di genere 'Romanzo', mostrando nome, cognome e titolo del libro.
-- (nome utente, cognome utente, titolo)

select utente.nome, utente.cognome, libro.titolo
from utente
join prestito on utente.cf = prestito.cf
join libro on prestito.isbn = libro.isbn
where libro.genere = 'Romanzo';
-- join implicita:
select utente.nome, utente.cognome, libro.titolo
from utente, prestito, libro
where utente.cf = prestito.cf and prestito.isbn = libro.isbn 
	and libro.genere = 'Romanzo';

-- 3. il numero totale di libri registrati per città, mostrando la citta e il numero totale dei libri
-- (Citta, Totale libri)

select cittacap, sum(librireg) as totalelibri
from biblioteca
group by cittacap;

-- 4. il numero totale di prestiti effettuati per ogni utente, mostrando nome, cognome e numero totalle prestiti
-- (Nome utente, cognome utente, numero prestiti)

select utente.nome, utente.cognome, count(*) as totaleprestiti
from utente 
join prestito on utente.cf = prestito.cf
group by utente.nome, utente.cognome
order by totaleprestiti desc;
-- join implicita:
select utente.nome, utente.cognome, count(*) as totaleprestiti
from utente, prestito
where utente.cf = prestito.cf
group by utente.nome, utente.cognome
order by totaleprestiti desc;

-- 5. il numero totale di prestiti per ogni utente, mostrando solo gli utenti che hanno effettuato 2 o piu' prestiti.
-- (nome utente, cognome utente, numero prestiti)

select utente.nome, utente.cognome, count(*) as totaleprestiti
from utente 
join prestito on utente.cf = prestito.cf
group by utente.nome, utente.cognome
having totaleprestiti >= 2
order by totaleprestiti desc;
-- join implicita
select utente.nome, utente.cognome, count(*) as totaleprestiti
from utente, prestito
where utente.cf = prestito.cf
group by utente.nome, utente.cognome
having totaleprestiti >= 2
order by totaleprestiti desc;

-- 6. le biblioteche che hanno registrato il maggior numero di prestiti, mostrando il numero totale di prestiti per biblioteca, includendo solo le biblioteche che hanno il numero massimo di prestiti.
-- (Nome biblioteca, numero prestiti)

create view totaleprestitiperbiblioteca as (
    select collocazione.nomeb, count(*) as totaleprestiti
    from prestito, collocazione
    where prestito.isbn = collocazione.isbn
    group by collocazione.nomeb
);
select *
from totaleprestitiperbiblioteca
where totaleprestiti = (select max(totaleprestiti)
						from totaleprestitiperbiblioteca);

-- 7. seleziona gli autori che hanno scritto almeno un libro publicato dopo il 1970, ma che non hanno scritto libri di genere "Fantasy"
-- (nome autore, cognome autore, titolo)

select autore.nome, autore.cognome, libro.titolo
from autore, scrittura, libro
where autore.nome = scrittura.nome and autore.cognome = scrittura.cognome 
	and scrittura.isbn = libro.isbn and libro.annopubbl > 1970 
    and (autore.nome, autore.cognome) not in (
		select autore.nome, autore.cognome 
		from autore, scrittura, libro
		where autore.nome = scrittura.nome and autore.cognome = scrittura.cognome 
		and scrittura.isbn = libro.isbn and libro.genere = 'Fantasy');

-- 8. tutti gli autori che hanno scritto tutti i lbri di una determinata biblioteca
-- (nome autore, cognome autore)

select autore.nome, autore.cognome
from autore
where not exists (
    -- primo not exists: trova i libri della biblioteca che non sono stati scritti dall'autore
    select *
    from libro, collocazione
    where libro.isbn = collocazione.isbn and collocazione.nomeb = 'Biblioteca Milano'
    and not exists (
        -- secondo not exists: verifica che l'autore ha scritto il libro
        select *
        from scrittura
        where scrittura.isbn = libro.isbn
        and scrittura.nome = autore.nome
        and scrittura.cognome = autore.cognome
    )
);

