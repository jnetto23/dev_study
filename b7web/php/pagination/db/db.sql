DROP DATABASE IF EXISTS bestseller_books;
CREATE DATABASE IF NOT EXISTS bestseller_books
DEFAULT CHARSET utf8
DEFAULT COLLATE utf8_general_ci;

USE bestseller_books;

DROP TABLE IF EXISTS authors;
CREATE TABLE IF NOT EXISTS authors (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# INSERT DEFAULT AUTHORS
INSERT INTO `authors` (`name`) VALUES 
("Agatha Christie"), ("Albert Camus"), ("Alex Comfort"), ("Alexander Alexandrovich Fadeyev"), ("Alice Sebold"), ("Anna Sewell"), ("Anne Frank"), ("Antoine de Saint-Exupéry"), ("Arlene Eisenberg e Heidi Murkoff"), ("Beatrix Potter"), 
("C. S. Lewis"), ("Cao Xueqin"), ("Carlo Collodi"), ("Carlos Ruiz Zafón"), ("Charles Dickens"), ("Charles Sheldon"), ("Chinua Achebe"), ("Colleen McCullough"), ("Dale Carnegie"), ("Dan Brown"), 
("Dante Alighieri"), ("Desmond Morris"), ("Douglas Adams"), ("Dr. Seuss"), ("Dr. Benjamin Spock"), ("E. L. James"), ("Elbert Hubbard"), ("Elie Wiesel"), ("Elwyn Brooks White; ilustrado por Garth Williams"), ("Eric Carle"), 
("Erica Jong"), ("Erich Segal"), ("Ernest Hemingway"), ("Erskine Caldwell"), ("F. Scott Fitzgerald"), ("Frank Herbert"), ("Gabriel García Márquez"), ("George Orwell"), ("Grace Metalious"), ("H. Rider Haggard"), 
("Hal Lindsey, C. C. Carlson"), ("Harper Lee"), ("Haruki Murakami"), ("J. D. Salinger"), ("J. K. Rowling"), ("J. P. Donleavy"), ("J. R. R. Tolkien"), ("Jack Higgins"), ("Jacqueline Susann"), ("James Clavell"), 
("James Redfield"), ("Janette Sebring Lowrey"), ("Jaroslav Hašek"), ("Jeffrey Archer"), ("Jiang Rong"), ("Johanna Spyri"), ("John Green"), ("John Steinbeck"), ("Johnston McCulley"), ("Joseph Heller"), 
("Jostein Gaarder"), ("Julia Donaldson"), ("Jung Chang"), ("Ken Follett"), ("Kenneth Grahame"), ("Khaled Hosseini"), ("Khalil Gibran"), ("Leo Tolstoy"), ("Lew Wallace"), ("Lois Lowry"), 
("Louise Hay"), ("Lucy Maud Montgomery"), ("Madeleine L'Engle"), ("Marabel Morgan"), ("Margaret Mitchell"), ("Margaret Wise Brown"), ("Marilyn French"), ("Mario Puzo"), ("Mark Twain"), ("Maurice Sendak"), 
("Michael Ende"), ("Miguel de Cervantes"), ("Mikhail Sholokhov"), ("Mitch Albom"), ("Napoleon Hill"), ("Nicholas Evans"), ("Nikolai Ostrovsky"), ("Norman Vincent Peale"), ("Osamu Dazai"), ("Patrick Süskind"), 
("Paulo Coelho"), ("Peter Benchley"), ("Pierre Dukan"), ("Raymond Moody"), ("Rhonda Byrne"), ("Richard Adams"), ("Richard Bach"), ("Richard Nelson Bolles"), ("Rick Warren"), ("Roald Dahl"), 
("Robert James Waller"), ("Robert L. Short"), ("Robert Munsch"), ("S. E. Hinton"), ("Sam McBratney"), ("Sergey Mikhalkov"), ("Shere Hite"), ("Spencer Johnson"), ("Stephen Hawking"), ("Stephen R. Covey"), 
("Stieg Larsson"), ("Sue Townsend"), ("Susanna Tamaro"), ("Suzanne Collins"), ("Taichi Sakaiya"), ("Tetsuko Kuroyanagi"), ("Thor Heyerdahl"), ("Tomás Eloy Martínez"), ("Umberto Eco"), ("V. C. Andrews"), 
("Viktor Frankl"), ("Vladimir Nabokov"), ("Wayne Dyer"), ("William Bradford Huie"), ("William P. Young"), ("William Peter Blatty"), ("Xaviera Hollander"), ("Xue Muqiao"), ("Yann Martel"), ("Yu Dan");


DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `id_author` INT(11) NOT NULL,
    `title` VARCHAR(150) NOT NULL,
    `originalLanguage` VARCHAR(100) NOT NULL,
    `firstPost` CHAR(4),
    `approximateSales` FLOAT NOT NULL,
    PRIMARY KEY(`id`),
    KEY `FK_books_authors_idx` (`id_author`),
	CONSTRAINT `FK_books_authors_idx` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# INSERT DEFAULT BOOKS
INSERT INTO books (`id_author`, `title`, `originalLanguage`, `firstPost`, `approximateSales`) VALUES
(82, "Don Quixote", "Espanhol", "1612", 500), (15, "Um Conto de Duas Cidades", "Inglês", "1859", 200), (91, "O alquimista", "Português", "1988", 150), (47, "O Senhor dos Anéis", "Inglês", "1954", 150), (8, "O Pequeno Príncipe", "Francês", "1943", 140), (45, "Harry Potter e a Pedra Filosofal", "Inglês", "1997", 107), (47, "O Hobbit", "Inglês", "1937", 100), (1, "O Caso dos Dez Negrinhos ", "Inglês", "1939", 100), (12, "O Sonho da Câmara Vermelha", "Chinês", "1754", 100), (40, "Ela, a Feiticeira", "Inglês", "1887", 100), 
(11, "O Leão, a Feiticeira e o Guarda-Roupa", "Inglês", "1950", 85), (20, "O Código Da Vinci", "Inglês", "2003", 80), (85, "Pense e Enriqueça", "Inglês", "1937", 70), (45, "Harry Potter e o Enigma do Príncipe", "Inglês", "2005", 65), (44, "O Apanhador no Campo de Centeio ", "Inglês", "1951", 65), (45, "Harry Potter e a Câmara Secreta", "Inglês", "1998", 60), (45, "Harry Potter e o Prisioneiro de Azkaban", "Inglês", "1999", 55), (45, "Harry Potter e o Cálice de Fogo", "Inglês", "2000", 55), (45, "Harry Potter e a Ordem da Fênix", "Inglês", "2003", 55), (45, "Harry Potter e as Relíquias da Morte", "Inglês", "2007", 50), 
(37, "Cem Anos de Solidão", "Espanhol", "1967", 50), (122, "Lolita", "Russo", "1955", 50), (56, "Heidi", "Alemão", "1880", 50), (25, "Meu Filho, Meu Tesouro", "Inglês", "1946", 50), (72, "Anna Shirley ", "Inglês", "1908", 50), (6, "Beleza Negra ", "Inglês", "1877", 50), (119, "O Nome da Rosa", "Italiano", "1980", 50), (48, "A Águia Pousou", "Inglês", "1975", 50), (96, "Era uma Vez em Watership Down", "Inglês", "1972", 50), (107, "O Relatório Hite sobre sexualidade feminina", "Inglês", "1976", 50), 
(29, "A Menina e o Porquinho ", "Inglês", "1952", 50), (46, "Um Safado em Dublin", "Inglês", "1955", 50), (101, "As Pontes de Madison", "Inglês", "1992", 50), (69, "Ben-Hur: Uma História dos Tempos de Cristo", "Inglês", "1880", 50), (59, "The Mark of Zorro", "Inglês", "1924", 50), (10, "A História do Pedro Coelho", "Inglês", "1902", 45), (97, "Fernão Capelo Gaivota", "Inglês", "1970", 44), (26, "Cinquenta Tons de Cinza ", "Inglês", "2011", 40), (27, "Mensagem a Garcia", "Inglês", "1899", 40), (61, "O Mundo de Sofia", "Norueguês", "1991", 40), 
(120, "O Jardim dos Esquecidos", "Inglês", "1979", 40), (20, "Anjos e Demônios", "Inglês", "2000", 39), (87, "Kak zakalyalas' stal'; Assim Foi Temperado O Aço", "Russo", "1932", 36.4), (68, "Voyna i mir; Guerra e Paz", "Russo", "1869", 36), (13, "As Aventuras de Pinóquio", "Italiano", "1881", 35), (71, "Você pode curar sua vida", "Inglês", "1984", 35), (123, "Seus Pontos Fracos", "Inglês", "1976", 35), (41, "O Falecido Grande Planeta Terra", "Inglês", "1970", 35), (54, "Caim e Abel", "Inglês", "1979", 34), (18, "Pássaros Feridos", "Inglês", "1977", 33), 
(49, "O Vale das Bonecas", "Inglês", "1966", 31), (16, "Em Seus Passos o Que Faria Jesus?", "Inglês", "1896", 30), (42, "O Sol é Para Todos ", "Inglês", "1960", 30), (20, "O Símbolo Perdido", "Inglês", "2009", 30), (75, "...E o Vento Levou ", "Inglês", "1936", 30), (7, "Diário de Anne Frank", "Neerlandês", "1947", 30), (99, "Uma Vida com Propósitos", "Inglês", "2002", 30), (124, "The Revolt of Mamie Stover", "Inglês", "1951", 30), (111, "Os Homens que Não Amavam as Mulheres ", "Sueco", "2005", 30), (30, "Uma Lagarta Muito Comilona", "Inglês", "1969", 30), 
(4, "A Jovem Guarda", "Russo", "1945", 26), (108, "Quem Mexeu no Meu Queijo?", "Inglês", "1998", 26), (35, "O Grande Gatsby", "Inglês", "1925", 25), (65, "O Vento nos Salgueiros", "Inglês", "1908", 25), (38, "Mil Novecentos e Oitenta e Quatro", "Inglês", "1949", 25), (110, "Os Sete Hábitos das Pessoas Altamente Eficazes", "Inglês", "1989", 25), (83, "Podnyataya Tselina; Virgin Soil Upturned", "Russo", "1935", 24), (51, "A Profecia Celestina", "Inglês", "1993", 23), (114, "Jogos Vorazes ", "Inglês", "2008", 23), (106, "Dyadya Styopa; Tio Styopa", "Russo", "1936", 21), 
(78, "O Poderoso Chefão ", "Inglês", "1969", 21), (32, "Uma História de Amor", "Inglês", "1970", 21), (55, "狼图腾 O Totem do Lobo", "Chinês", "2004", 20), (127, "A Aliciadora Feliz", "Inglês", "1971", 20), (92, "Tubarão", "Inglês", "1974", 20), (103, "Love You Forever", "Inglês", "1986", 20), (77, "The Women's Room", "Inglês", "1977", 20), (9, "O Que Esperar Quando Você Está Esperando", "Inglês", "1984", 20), (79, "As Aventuras de Huckleberry Finn", "Inglês", "1885", 20), (112, "O diário secreto de um adolescente ", "Inglês", "1982", 20), 
(117, "A Expedição Kon-Tiki", "Norueguês", "1950", 20), (53, "O Bom Soldado Švejk", "Tcheco", "1923", 20), (80, "Onde Vivem os Monstros ", "Inglês", "1963", 20), (88, "O Poder do Pensamento Positivo", "Inglês", "1952", 20), (125, "A Cabana", "Inglês", "2007", 20), (95, "O Segredo", "Inglês", "2006", 20), (31, "Fear of Flying", "Inglês", "1973", 20), (36, "Duna", "Inglês", "1965", 20), (57, "A Culpa É das Estrelas", "Inglês", "2012", 18.5), (76, "Boa Noite Lua", "Inglês", "1947", 16), 
(81, "A História Sem Fim ", "Alemão", "1979", 16), (105, "Adivinha Quanto Eu Te Amo", "Inglês", "1994", 15), (50, "Xógum - A Gloriosa Saga do Japão", "Inglês", "1975", 15), (52, "The Poky Little Puppy", "Inglês", "1942", 15), (64, "Os Pilares da Terra", "Inglês", "1989", 15), (19, "Como Fazer Amigos e Influenciar Pessoas", "Inglês", "1936", 15), (90, "O Perfume", "Alemão", "1985", 15), (58, "As Vinhas da Ira", "Inglês", "1939", 15), (86, "O Encantador de Cavalos", "Inglês", "1995", 15), (14, "A Sombra do Vento", "Espanhol", "2001", 15), 
(116, "Totto-chan, the Little Girl at the Window", "Japonês", "1981", 14.36), (23, "O Guia do Mochileiro das Galáxias", "Inglês", "1979", 14), (84, "As Terças com Morrie", "Inglês", "1997", 14), (34, "O Pequeno Rincão de Deus", "Inglês", "1933", 14), (113, "Va' dove ti porta il cuore", "Italiano", "1994", 14), (73, "Uma Dobra no Tempo", "Inglês", "1962", 14), (33, "O Velho e o Mar", "Inglês", "1952", 13), (104, "The Outsiders", "Inglês", "1967", 13), (100, "A Fantástica Fábrica de Chocolate ", "Inglês", "1964", 13), (94, "Vida depois da Vida", "Inglês", "1975", 13), 
(43, "Norwegian Wood", "Japonês", "1987", 12), (39, "Peyton Place", "Inglês", "1956", 12), (2, "A Peste", "Francês", "1947", 12), (89, "Humanidade Perdida ", "Japonês", "1948", 12), (22, "O Macaco Nu", "Inglês", "1968", 12), (121, "Em Busca de Sentido", "Alemão", "1946", 12), (21, "Divina Comédia", "Italiano", "1304", 11-12), (17, "O Mundo Se Despedaça ", "Inglês", "1958", 11), (67, "O Profeta", "Inglês", "1923", 11), (126, "O Exorcista", "Inglês", "1971", 11), 
(62, "O Grufalo", "Inglês", "1999", 10.5), (60, "Ardil 22 ", "Inglês", "1961", 10), (64, "O Buraco da Agulha", "Inglês", "1978", 10), (109, "Uma Breve História do Tempo", "Inglês", "1988", 10), (24, "O Gato com Chapéu", "Inglês", "1957", 10), (5, "Uma Vida Interrompida ", "Inglês", "2002", 10), (63, "(Cisnes Selvagens)", "Inglês", "1992", 10), (118, "Santa Evita", "Espanhol", "1995", 10), (28, "A Noite", "Iídiche", "1958", 10), (66, "O Caçador de Pipas ", "Inglês", "2003", 10), 
(130, "Confucius from the Heart", "Chinês", "2006", 10), (74, "A Mulher Total", "Inglês", "1974", 10), (115, "Knowledge-value Revolution", "Japonês", "1985", 10), (128, "Problems in China's Socialist Economy", "Chinês", "1979", 10), (98, "What Color is Your Parachute?", "Inglês", "1970", 10), (93, "Dieta Dukan", "Francês", "2000", 10), (3, "Os Prazeres do Sexo", "Inglês", "1972", 10), (102, "The Gospel According to Peanuts", "Inglês", "1965", 10), (129, "A Vida de Pi", "Inglês", "2001", 10), (70, "O Doador", "Inglês", "1993", 10);
