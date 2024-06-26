USE BD_Orchestre
GO 

INSERT INTO Orchestres.Instrument (NomInstrument)
VALUES
('Violon'),
('Fl�te Traversi�re'),
('Trompette'),
('Clarinette'),
('Saxophone alto'),
('Violoncelle'),
('Piano'),
('Trombone'),
('Harpe'),
('Contrebasse'),
('Batterie'),
('Guitard'),
('Saxophone baryton'),
('Basse �lectronique'),
('Triangle'),
('Tuba'),
('Violon'),
('Fl�te Traversi�re'),
('Trompette'),
('Clarinette'),
('Saxophone alto'),
('Violoncelle'),
('Piano'),
('Trombone'),
('Harpe'),
('Contrebasse'),
('Batterie'),
('Guitard'),
('Saxophone baryton'),
('Basse �lectronique'),
('Triangle'),
('Tuba'),
('Harpe'),
('Contrebasse'),
('Batterie'),
('Guitard'),
('Saxophone baryton'),
('Basse �lectronique'),
('Triangle'),
('Tuba');

GO


INSERT INTO Orchestres.InstrumentVent(TypeVent, Materiaux, InstrumentID)
VALUES 
('Fl�te Traversi�re', 'Bois', 1),
('Saxophone alto', 'M�tal', 5),
('Trompette', 'M�tal', 3),
('Clarinette', 'Bois', 4),
('Trombone', 'M�tal', 8),
('Tuba', 'M�tal', 16),
('Saxophone baryton', 'M�tal', 13),
('Fl�te Traversi�re', 'Bois', 1),
('Saxophone alto', 'M�tal', 6),
('Trompette', 'M�tal', 9),
('Clarinette', 'Bois', 11),
('Trombone', 'M�tal', 14),
('Tuba', 'M�tal', 12),
('Saxophone baryton', 'M�tal', 15),
('Fl�te Traversi�re', 'Bois', 7),
('Saxophone alto', 'M�tal', 10),
('Fl�te Traversi�re', 'Bois', 17),
('Saxophone alto', 'M�tal', 18),
('Trompette', 'M�tal', 19),
('Clarinette', 'Bois', 20),
('Trombone', 'M�tal', 21),
('Tuba', 'M�tal', 22),
('Saxophone baryton', 'M�tal', 23),
('Fl�te Traversi�re', 'Bois', 24),
('Saxophone alto', 'M�tal', 25),
('Trompette', 'M�tal', 26) ,
('Clarinette', 'Bois', 27),
('Trombone', 'M�tal' ,28),
('Tuba', 'M�tal', 29),
('Saxophone baryton', 'M�tal', 30),
('Fl�te Traversi�re', 'Bois', 31),
('Saxophone alto', 'M�tal', 32),
('Trompette', 'M�tal', 33),
('Clarinette', 'Bois', 34),
('Trombone', 'M�tal', 35),
('Tuba', 'M�tal', 36),
('Saxophone baryton', 'M�tal', 37),
('Fl�te Traversi�re', 'Bois', 38),
('Saxophone alto', 'M�tal', 39),
('Trompette', 'M�tal', 40);
GO


INSERT INTO Orchestres.InstrumentCorde (TypeCorde, NbCorde, InstrumentID)
VALUES
('Violon', 4, 1),
('Violoncelle', 4, 6),
('Contrebasse', 5, 10),
('Basse �lectronique', 4, 14),
('Harpe', 47, 9),
('Alto', 4, 2),
('Violoncelle', 4, 15),
('Contrebasse', 5, 4),
('Basse �lectronique', 4, 11),
('Harpe', 47, 16),
('Alto', 4, 8),
('Violon', 4, 13),
('Violoncelle', 4, 5),
('Contrebasse', 5, 3),
('Basse �lectronique', 4, 7),
('Harpe', 47, 12),
('Violon', 4, 17),
('Violoncelle', 4, 18),
('Contrebasse', 5, 19),
('Basse �lectronique', 4, 20),
('Harpe', 47, 21),
('Alto', 4, 22),
('Violoncelle', 4, 23),
('Contrebasse', 5, 24),
('Basse �lectronique', 4, 25),
('Harpe', 47, 26),
('Alto', 4, 27),
('Violoncelle', 4, 28),
('Contrebasse', 5, 29),
('Basse �lectronique', 4, 30),
('Harpe', 47, 31),
('Alto', 4, 32),
('Violon', 4, 33),
('Violoncelle', 4, 34),
('Contrebasse', 5, 35),
('Basse �lectronique', 4, 36),
('Harpe', 47, 37),
('Alto', 4, 38),
('Violoncelle', 4, 39),
('Contrebasse', 5, 40);

GO


INSERT INTO Orchestres.Percussion (TypePercussion, MateriauxPercussion, InstrumentID)
VALUES
('Tambour', 'Bois', 11),
('Batterie', 'M�tal', 12),
('Triangle', 'M�tal', 15),
('Grosse caisse', 'Bois', 13),
('Cymbales', 'M�tal', 14),
('Tambour', 'Plastique', 1),
('Batterie', 'M�tal', 2),
('Triangle', 'M�tal', 3),
('Grosse caisse', 'Bois', 4),
('Cymbales', 'M�tal', 5),
('Tambour', 'Plastique', 6),
('Batterie', 'M�tal', 7),
('Triangle', 'M�tal', 8),
('Grosse caisse', 'Bois', 9),
('Cymbales', 'M�tal', 10),
('Tambour', 'Plastique', 16),
('Batterie', 'M�tal', 17),
('Triangle', 'M�tal', 18),
('Grosse caisse', 'Bois', 19),
('Cymbales', 'M�tal', 20),
('Tambour', 'Plastique', 21),
('Batterie', 'M�tal', 22),
('Triangle', 'M�tal', 23),
('Grosse caisse', 'Bois', 24),
('Cymbales', 'M�tal', 25),
('Tambour', 'Plastique', 26),
('Batterie', 'M�tal', 27),
('Triangle', 'M�tal', 28),
('Grosse caisse', 'Bois', 29),
('Cymbales', 'M�tal', 30),
('Tambour', 'Plastique', 31),
('Batterie', 'M�tal', 32),
('Triangle', 'M�tal', 33),
('Grosse caisse', 'Bois', 34),
('Cymbales', 'M�tal', 35),
('Tambour', 'Plastique', 36),
('Batterie', 'M�tal', 37),
('Triangle', 'M�tal', 38),
('Grosse caisse', 'Bois', 39),
('Cymbales', 'M�tal', 40);

GO
INSERT INTO Professeurs.Professeur (Nom, Prenom, NoEmploye, InstrumentID)
VALUES
('Dupont', 'Jean', 'EMP001044', 1),
('Martin', 'Sophie', 'EMP0022', 2),
('Lefevre', 'Pierre', 'EMP00333', 3),
('Gagnon', 'Isabelle', 'EMP0004', 4),
('Roy', 'Philippe', 'EMP0505', 5),
('Boucher', 'Marie', 'EMP0056', 6),
('Bergeron', 'Paul', 'EMP0507', 7),
('Girard', 'Julie', 'EMP0208', 8),
('Leclerc', 'Michel', 'EMP5009', 9),
('Fortin', 'Catherine', 'EMP55010', 10),
('Desjardins', 'Fran�ois', 'EMP58011', 11),
('Dufour', 'Val�rie', 'EMP52012', 12),
('Tremblay', 'Luc', 'EMP06513', 13),
('Pelletier', 'Nathalie', 'EMP02214', 14),
('Caron', '�ric', 'EMP06615', 15),
('Gagn�', 'Louise', 'EMP065216', 16),
('Morin', 'Sylvie', 'EMP065417', 17),
('Lavoie', 'Christian', 'EMP065518', 18),
('C�t�', 'Martine', 'EMP065719', 19),
('Lemieux', 'Richard', 'EMP065820', 20),
('Fournier', 'Isabel', 'EMP065121', 21),
('Gosselin', 'Daniel', 'EMP065222', 22),
('Rousseau', 'St�phanie', 'EMP065323', 23),
('B�langer', 'Luc', 'EMP065424', 24),
('L�vesque', 'Nancy', 'EMP065525', 25),
('Michaud', 'Mario', 'EMP065626', 26),
('Bouchard', 'Marie-Claude', 'EMP065727', 27),
('Bernard', 'Fran�ois', 'EMP065828', 28),
('Lachance', 'C�line', 'EMP065929', 29),
('Gagnon', 'R�my', 'EMP066030', 30),
('Bolduc', 'Anne', 'EMP066131', 31),
('Cloutier', 'Robert', 'EMP066232', 32),
('Deschamps', 'S�bastien', 'EMP066333', 33),
('Hamel', 'Caroline', 'EMP066434', 34),
('Lalonde', 'Micha�l', 'EMP066535', 35),
('Beauchemin', 'Genevi�ve', 'EMP066636', 36),
('Laurin', 'Yves', 'EMP066737', 37),
('Moreau', 'Marie-�ve', 'EMP066838', 38),
('Trudeau', 'Denis', 'EMP066939', 39),
('Dion', 'Val�rie', 'EMP067040', 40);



GO

INSERT INTO Orchestres.Orchestre (NbEtudiant, NbSection, NoLocal, ProfesseurID)
VALUES 
(20, 1, 'A101', 1),
(15, 2, 'B202',  2),
(25, 3, 'C303', 3),
(30, 4, 'D404',  4),
(18, 1, 'E505', 5),
(22, 2, 'F606',  6),
(17, 3, 'G707',  7),
(21, 4, 'H808', 8),
(28, 1, 'I909',  9),
(19, 2, 'J1010', 10);


GO



INSERT INTO Etudiants.Etudiant (Nom, Prenom, NoEtudiant, Niveau, InstrumentID, OrchestreID)
VALUES
('Tremblay', 'Marie', 'ETU001', 3, 1, 1),
('Gagnon', 'Alexandre', 'ETU002', 2, 2, 2),
('Lavoie', 'Sophie', 'ETU003', 1, 3, 3),
('Leblanc', 'Mathieu', 'ETU004', 4, 4, 4),
('Bergeron', 'Catherine', 'ETU005', 3, 5, 5),
('Gauthier', 'Patrick', 'ETU006', 2, 6, 6),
('Roy', 'Isabelle', 'ETU007', 1, 7, 7),
('Morin', 'Micha�l', 'ETU008', 4, 8, 8),
('Lemieux', '�milie', 'ETU009', 3, 9, 9),
('Poulin', 'Louis', 'ETU010', 1, 10, 10),
('Martin', 'St�phanie', 'ETU011', 2, 11, 10),
('Girard', 'Marc', 'ETU012', 4, 12, 9),
('Dufour', 'Val�rie', 'ETU013', 3, 13, 8),
('C�t�', 'David', 'ETU014', 2, 14, 7),
('Pelletier', 'Nathalie', 'ETU015', 1, 15, 6),
('L�vesque', 'Sylvain', 'ETU016', 4, 16, 5),
('Lachance', '�tienne', 'ETU017', 3, 17,4),
('Lefebvre', 'Julie', 'ETU018', 2, 18,3),
('Gagn�', 'Gabriel', 'ETU019', 1,19,2),
('Lemay', 'Sylvie', 'ETU020', 4, 20,1),
('Bertrand', 'Luc', 'ETU021', 3, 21,10),
('Couture', 'Marie-Claude', 'ETU022', 2,22,9),
('St-Pierre', 'Mathieu', 'ETU023', 1, 23,8),
('Boucher', 'Isabelle', 'ETU024', 4, 24,7),
('Lafontaine', 'Marc', 'ETU025', 3, 26,6),
('Bilodeau', 'M�lanie', 'ETU026', 1, 27,5),
('Gosselin', 'David', 'ETU027', 2, 28,4),
('M�nard', 'Sophie', 'ETU028', 4, 29,3),
('Trudeau', 'Alexandre', 'ETU029', 3, 30,2),
('Lavoie', 'Val�rie', 'ETU030', 2, 31,1),
('Giroux', 'Mathieu', 'ETU031', 1, 32,10),
('Roy', 'Isabelle', 'ETU032', 4, 33,9),
('Leblanc', 'Jean-Fran�ois', 'ETU057', 3,34,8),
('Bertrand', 'Val�rie', 'ETU058', 1, 35,7),
('Gagn�', 'Simon', 'ETU059', 2,36,6),
('Martin', 'M�lanie', 'ETU060', 4, 37,5),
('Larose', 'David', 'ETU061', 3, 38,4),
('C�t�', 'Caroline', 'ETU062', 2,39,3),
('Bilodeau', 'St�phane', 'ETU063', 1,40,2);
GO



INSERT INTO Orchestres.PieceMusique (Titre, Auteur, Difficulte, StyleMusique, Tonalite, Tempo, ProfesseurID, OrchestreID)
VALUES 
('Symphonie No. 1', 'Beethoven', 'Difficile', 'Classique', 'R�', 'Allegro', 1, 1),
('Jazz Improv', 'Davis', 'Moyen', 'Jazz', 'Mi', 'Moderato', 2, 2),
('Gospel Celebration', 'Johnson', 'Facile', 'Gospel', 'Si', 'Andante', 3, 3),
('Concerto for Strings', 'Bach', 'Difficile', 'Classique', 'La', 'Allegro', 4, 4),
('Smooth Operator', 'Sade', 'Moyen', 'Jazz', 'Sol', 'Adagio', 5, 5),
('Classical Fusion', 'Mozart', 'Difficile', 'Classique', 'R�#', 'Vivace', 6, 6),
('Blues in Bb', 'King', 'Facile', 'Jazz', 'Si#', 'Moderato', 7, 7),
('Heavenly Voices', 'Gospel Choir', 'Facile', 'Gospel', 'Fa', 'Andante', 8, 2),
('Romantic Rhapsody', 'Chopin', 'Difficile', 'Classique', 'Sol#', 'Largo', 9, 6),
('Latin Groove', 'Santana', 'Moyen', 'Jazz', 'Mi#', 'Allegro', 10, 10),
('Soulful Sounds', 'Franklin', 'Facile', 'Gospel', 'La', 'Andante', 11, 1),
('Spring Concerto', 'Vivaldi', 'Difficile', 'Classique', 'Si#', 'Allegro', 12, 2),
('Funky Blues', 'Hendrix', 'Moyen', 'Jazz', 'Fa#', 'Moderato', 13, 3),
('Joyful Praise', 'Gospel Ensemble', 'Facile', 'Gospel', 'La#', 'Andante', 14, 4),
('Mystical Sonata', 'Beethoven', 'Difficile', 'Classique', 'Do', 'Largo', 15, 4),
('Cool Jazz Vibes', 'Davis', 'Moyen', 'Jazz', 'Sol#', 'Andante', 16, 3),
('Harmony in D', 'Bach', 'Difficile', 'Classique', 'R�#', 'Allegro', 17, 5),
('Midnight Blues', 'King', 'Moyen', 'Jazz', 'Mi#', 'Moderato', 18, 8),
('Soul Serenade', 'Franklin', 'Facile', 'Gospel', 'Fa#', 'Andante', 19, 9),
('Autumn Sonata', 'Chopin', 'Difficile', 'Classique', 'Sol#', 'Largo', 20, 8),
('Samba Nights', 'Jobim', 'Moyen', 'Jazz', 'Mi', 'Allegro', 21, 1),
('Divine Voices', 'Gospel Choir', 'Facile', 'Gospel', 'La#', 'Andante', 22, 2),
('Concerto in G', 'Mozart', 'Difficile', 'Classique', 'Si', 'Allegro', 23, 3),
('Bebop Rhythms', 'Davis', 'Moyen', 'Jazz', 'Sol', 'Moderato', 24,4),
('Eternal Harmony', 'Beethoven', 'Difficile', 'Classique', 'Do', 'Largo', 25, 5),
('Groovy Jazz Jam', 'Coltrane', 'Moyen', 'Jazz', 'La#', 'Andante', 26, 6),
('Heavenly Choir', 'Gospel Ensemble', 'Facile', 'Gospel', 'Si#', 'Allegro', 27, 10),
('Winter Sonata', 'Vivaldi', 'Difficile', 'Classique', 'R�', 'Allegro', 28,8),
('Latin Fusion', 'Santana', 'Moyen', 'Jazz', 'Mi#', 'Moderato', 29, 7),
('Soulful Praises', 'Gospel Choir', 'Facile', 'Gospel', 'Fa', 'Andante', 30, 10),
('Rhapsody in Blue', 'Gershwin', 'Difficile', 'Classique', 'Sol#', 'Allegro', 31, 1),
('Smooth Jazz Vibes', 'Davis', 'Moyen', 'Jazz', 'Do', 'Andante', 32, 2),
('Summer Serenade', 'Beethoven', 'Difficile', 'Classique', 'R�#', 'Allegro', 33, 4),
('Bluesy Night', 'King', 'Moyen', 'Jazz', 'Mi#', 'Moderato', 34, 6),
('Gospel Celebration', 'Franklin', 'Facile', 'Gospel', 'Fa#', 'Andante', 35, 5),
('Spring Symphony', 'Mozart', 'Difficile', 'Classique', 'Sol#', 'Largo', 36, 6),
('Salsa Groove', 'Puente', 'Moyen', 'Jazz', 'Mi', 'Allegro', 37, 3),
('Divine Harmony', 'Gospel Ensemble', 'Facile', 'Gospel', 'La#', 'Andante', 38, 2),
('Concerto for Strings', 'Bach', 'Difficile', 'Classique', 'Si', 'Allegro', 39, 9),
('Cool Jazz Fusion', 'Davis', 'Moyen', 'Jazz', 'Sol', 'Moderato', 40, 10);

GO




INSERT INTO Orchestres.ChoixOrchestrePieceMusique (DateDuChoix, OrchestreID, PieceMusiqueID)
VALUES 
('2024-02-01', 1, 1), 
('2024-02-02', 2, 2), 
('2024-02-03', 3, 3), 
('2024-02-04', 4, 4), 
('2024-02-05', 5, 5),
('2024-02-06', 6, 6), 
('2024-02-07', 7, 7), 
('2024-02-08', 8, 8), 
('2024-02-09', 9, 9), 
('2024-02-10', 10, 10),
('2024-02-11', 1, 11),
('2024-02-12', 2, 12), 
('2024-02-13', 3, 13), 
('2024-02-14', 4, 14), 
('2024-02-15', 5, 15),
('2024-02-16', 6, 16),
('2024-02-17', 1, 17), 
('2024-02-18', 2, 18), 
('2024-02-19', 3, 19), 
('2024-02-20', 4, 20),
('2024-02-21', 5, 21),
('2024-02-22', 6, 22), 
('2024-02-23', 7, 23), 
('2024-02-24', 8, 24), 
('2024-02-25', 9, 25),
('2024-02-26', 10, 26), 
('2024-02-27', 1, 27), 
('2024-02-28', 2, 28), 
('2024-02-29', 3, 29), 
('2024-03-01', 4, 30),
('2024-03-02', 5, 31),
('2024-03-03', 6, 32), 
('2024-03-04', 1, 33), 
('2024-03-05', 2, 34), 
('2024-03-06', 3, 35),
('2024-03-07', 4, 36), 
('2024-03-08', 5, 37), 
('2024-03-09', 6, 38), 
('2024-03-10', 7, 39), 
('2024-03-11', 8, 40);

GO



INSERT INTO Adresses.Adresse (NoPorte, Rue, Ville, Province, EtudiantID, ProfesseurID)
VALUES
('123', 'Rue Principale', 'Montr�al', 'Qu�bec', 1, 1),
('456', 'Avenue Saint-Jean', 'Qu�bec', 'Qu�bec', 2, 2),
('789', 'Rue des �rables', 'Sherbrooke', 'Qu�bec', 3, 3),
('102', 'Chemin du Lac', 'Trois-Rivi�res', 'Qu�bec', 4, 4),
('222', 'Boulevard de la Montagne', 'Gatineau', 'Qu�bec', 5, 5),
('333', 'Avenue des Lilas', 'Chicoutimi', 'Qu�bec', 6, 6),
('444', 'Rue du Vieux-Port', 'Rimouski', 'Qu�bec', 7, 7),
('555', 'Chemin de la Falaise', 'Sept-�les', 'Qu�bec', 8, 8),
('666', 'Boulevard Saint-Laurent', 'Val-d''Or', 'Qu�bec', 9, 9),
('777', 'Avenue des Neiges', 'Joliette', 'Qu�bec', 10, 10),
('888', 'Rue Saint-Paul', 'Victoriaville', 'Qu�bec', 11, 11),
('999', 'Chemin de la Plage', 'Rouyn-Noranda', 'Qu�bec', 12, 12),
('101', 'Avenue du Parc', 'Baie-Comeau', 'Qu�bec', 13, 13),
('202', 'Rue Sainte-Catherine', 'Saguenay', 'Qu�bec', 14, 14),
('303', 'Boulevard Ren�-L�vesque', 'Montr�al', 'Qu�bec', 15, 15),
('404', 'Avenue Papineau', 'Qu�bec', 'Qu�bec', 16, 16);
GO





