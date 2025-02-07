use progetto;

-- Inserimento nelle biblioteche
INSERT INTO biblioteca (nomeB, cittaCap, libriMax, libriReg) VALUES
('Centro Culturale', '00100', 15000, 12000),
('Biblioteca Milano', '20100', 20000, 18000),
('Libreria Napoli', '80100', 10000, 8000),
('Biblioteca Roma Est', '00156', 18000, 15000),
('Archivio Torino', '10100', 9000, 7500);

-- Inserimento libri
INSERT INTO libro (isbn, titolo, genere, annoPubbl) VALUES
('9781234567890', 'Il Nome della Rosa', 'Romanzo Storico', 1980),
('9782345678901', 'Se questo è un uomo', 'Memoria', 1947),
('9783456789012', 'Il Barone Rampante', 'Romanzo', 1957),
('9784567890123', 'Harry Potter e la Pietra Filosofale', 'Fantasy', 1997),
('9785678901234', '1984', 'Distopico', 1949),
('9786789012345', 'Il Signore degli Anelli', 'Fantasy', 1954),
('9787890123456', 'Orgoglio e Pregiudizio', 'Classico', 1813),
('9788901234567', 'Cime tempestose', 'Romanzo', 1847),
('9789012345678', 'Dracula', 'Horror', 1897);

-- Inserimento autori
INSERT INTO autore (nome, cognome, nazionalita) VALUES
('Umberto', 'Eco', 'Italiana'),
('Primo', 'Levi', 'Italiana'),
('Italo', 'Calvino', 'Italiana'),
('J.K.', 'Rowling', 'Britannica'),
('George', 'Orwell', 'Britannica'),
('J.R.R.', 'Tolkien', 'Britannica'),
('Jane', 'Austen', 'Britannica'),
('Emily', 'Brontë', 'Britannica'),
('Bram', 'Stoker', 'Irlandese');

-- Inserimento utenti
INSERT INTO utente (cf, nome, cognome, via, citta, cap, dataNascita, tipoUtente, professione, tutoreLegale) VALUES
('RSSMRA85M10H501H', 'Mario', 'Rossi', 'Via Roma 1', 'Roma', '00100', '1985-03-10', 'Adulto', 'Ingegnere', NULL),
('BNCLCU90A41H501K', 'Lucia', 'Bianchi', 'Via Milano 2', 'Milano', '20100', '2008-04-01', 'Minore', NULL, 'RSSMRA85M10H501H'),
('VRDLCU75P12H501Z', 'Luca', 'Verdi', 'Corso Umberto 3', 'Napoli', '80100', '1975-09-12', 'Adulto', 'Architetto', NULL),
('GLLGNN00M65H501X', 'Giovanna', 'Gialli', 'Via Torino 5', 'Torino', '10100', '2000-12-25', 'Adulto', 'Designer', NULL),
('MRAPSS05D12H501V', 'Paolo', 'Marrone', 'Viale dei Fiori 8', 'Palermo', '90100', '2005-04-12', 'Minore', NULL, 'GLLGNN00M65H501X'),
('BLUSRD82P45H501M', 'Sara', 'Blu', 'Piazza Garibaldi 3', 'Bologna', '40100', '1982-09-15', 'Adulto', 'Medico', NULL);

-- Inserimento bibliotecari
INSERT INTO bibliotecario (matricola, nomeB, cittaCap, dataAssunzione, durataContratto, nome, ruolo) VALUES
(101, 'Centro Culturale', '00100', '2020-05-15', 36, 'Marco', 'Responsabile'),
(202, 'Biblioteca Milano', '20100', '2019-02-10', 24, 'Giulia', 'Assistente'),
(303, 'Biblioteca Roma Est', '00156', '2022-01-10', 12, 'Anna', 'Catalogatore'),
(404, 'Archivio Torino', '10100', '2018-06-20', 60, 'Paolo', 'Direttore');

-- Collocazione libri
INSERT INTO collocazione (nomeB, cittaCap, isbn) VALUES
('Centro Culturale', '00100', '9781234567890'),
('Biblioteca Milano', '20100', '9782345678901'),
('Libreria Napoli', '80100', '9783456789012'),
('Centro Culturale', '00100', '9784567890123'),
('Biblioteca Milano', '20100', '9785678901234'),
('Archivio Torino', '10100', '9786789012345'),
('Biblioteca Roma Est', '00156', '9787890123456'),
('Libreria Napoli', '80100', '9788901234567'),
('Centro Culturale', '00100', '9789012345678');

-- Assegnazione autori ai libri
INSERT INTO scrittura (nome, cognome, isbn) VALUES
('Umberto', 'Eco', '9781234567890'),
('Primo', 'Levi', '9782345678901'),
('Italo', 'Calvino', '9783456789012'),
('J.K.', 'Rowling', '9784567890123'),
('George', 'Orwell', '9785678901234'),
('J.R.R.', 'Tolkien', '9786789012345'),
('Jane', 'Austen', '9787890123456'),
('Emily', 'Brontë', '9788901234567'),
('Bram', 'Stoker', '9789012345678');

-- Registrazione prestiti
INSERT INTO prestito (dataPrestito, cf, isbn, dataRestit) VALUES
('2023-10-01', 'RSSMRA85M10H501H', '9781234567890', '2023-11-01'),
('2023-09-15', 'VRDLCU75P12H501Z', '9783456789012', '2023-10-15'),
('2023-11-10', 'BLUSRD82P45H501M', '9786789012345', '2023-12-10'),
('2023-10-20', 'GLLGNN00M65H501X', '9787890123456', '2023-11-20'),
('2023-09-01', 'VRDLCU75P12H501Z', '9789012345678', '2023-10-01');

-- Inserimento numeri di telefono
INSERT INTO telefono (cf, numero) VALUES
('RSSMRA85M10H501H', '065551234'),
('BNCLCU90A41H501K', '022345678'),
('VRDLCU75P12H501Z', '081987654'),
('GLLGNN00M65H501X', '011998877'),
('BLUSRD82P45H501M', '051776655'),
('MRAPSS05D12H501V', '091223344');