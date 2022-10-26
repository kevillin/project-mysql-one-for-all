DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id_plano INT NOT NULL AUTO_INCREMENT,
      tipo_plano VARCHAR(15) NOT NULL,
      valor_plano DECIMAL(4,2) NOT NULL,
      PRIMARY KEY (id_plano)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuario(
      id_usuario INT NOT NULL AUTO_INCREMENT,
      nome_usuario VARCHAR(70),
      idade_usuario INT NOT NULL,
      id_plano INT,
      data_assinatura DATE NOT NULL,
      PRIMARY KEY (id_usuario),
      FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
  ) engine = InnoDB;
  
      CREATE TABLE SpotifyClone.artistas(
      id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_artista VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      id_album INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_album VARCHAR(50) NOT NULL,
      ano_lancamento INT NOT NULL,
      id_artista INT,
      FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      id_cancao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_cancao VARCHAR(70) NOT NULL,
      id_album INT,
      duracao INT,
      FOREIGN KEY (id_album) REFERENCES albuns (id_album)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_reproducoes(
      id_cancao INT,
      data_reproducao DATETIME,
      id_usuario INT,
      CONSTRAINT PRIMARY KEY (id_cancao, id_usuario),
      FOREIGN KEY (id_cancao) REFERENCES cancoes (id_cancao),
      FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.seguindo_artistas(
      id_artista INT, 
      id_usuario INT,
      CONSTRAINT PRIMARY KEY (id_artista, id_usuario),
        FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista),
        FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuario (id_usuario)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (tipo_plano, valor_plano)
  VALUES
    ('gratuito', 0.00),
	  ('universitario', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.usuario (nome_usuario, idade_usuario, id_plano, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, "2019-10-20"),
    ('Robert Cecil Martin', 58, 1, "2017-01-06"),
    ('Ada Lovelace', 37, 2, "2017-12-30"),
    ('Martin Fowler', 46, 2, "2017-01-17"),
    ('Sandi Metz', 58, 2, "2018-04-29"),
    ('Paulo Freire', 19, 3, "2018-02-14"),
    ('Bell Hooks', 26, 3, "2018-01-05"),
    ('Christopher Alexander', 85, 4, "2019-06-05"),
    ('Judith Butler', 45, 4, "2020-05-13"),
    ('Jorge Amado', 58, 4, "2017-02-17");

	INSERT INTO SpotifyClone.artistas (nome_artista)
	VALUES
		('Beyoncé'),
		('Queen'),
		('Elis Regina'),
		('Baco Exu do Blues'),
		('Blind Guardian'),
		('Nina Simone');
        
  INSERT INTO SpotifyClone.albuns (nome_album, ano_lancamento, id_artista)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);
        
	INSERT INTO SpotifyClone.cancoes (nome_cancao, id_album, duracao)
	VALUES
		('Break My Soul', 1, 279),
		('Virgo`s Groove', 1, 369),
		('Alien Superstar', 1, 116),
		('Don`t Stop Me Now', 2, 203),
		('Under Pressure', 3, 152),
		('Como Nossos Pais', 4, 105),
		('O Medo de Amar é o Medo de Ser Livre', 5, 207),
		('Samba em Paris', 6, 267),
		('The Bard`s Song', 7, 244),
		('Feeling Good', 8, 100);

  INSERT INTO SpotifyClone.historico_reproducoes (id_cancao, data_reproducao, id_usuario)
  VALUES
    (8, "2022-02-28 10:45:55", 1),
    (2, "2020-05-02 05:30:35", 1),
    (10, "2020-03-06 11:22:33", 1),
    (10, "2022-08-05 08:05:17", 2),
    (7, "2020-01-02 07:40:33", 2),
    (10, "2020-11-13 16:55:13", 3),
    (2, "2020-12-05 18:38:30", 3),
    (8, "2021-08-15 17:10:10", 4),
    (8, "2022-01-09 01:44:33", 5),
    (5,  "2020-08-06 15:23:43", 5),
    (7, "2017-01-24 00:31:17", 6),
    (1, "2017-10-12 12:35:20", 6),
    (4, "2011-12-15 22:30:49", 7),
    (4, "2012-03-17 14:56:41", 8),
    (9, "2022-02-24 21:14:22", 9),
    (3, "2015-12-13 08:30:22", 10);


  INSERT INTO SpotifyClone.seguindo_artistas (id_usuario, id_artista)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);