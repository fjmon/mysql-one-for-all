  DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
  CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      plano VARCHAR(45) NOT NULL,
      valor DECIMAL(4,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      usuario VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      assinatura DATE NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id)
        REFERENCES plano (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      artista VARCHAR(45) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      album VARCHAR(50) NOT NULL,
      lancamento INT NOT NULL,
      artista_id INT,
      FOREIGN KEY (artista_id) 
      REFERENCES SpotifyClone.artista (artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancao(
      cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      cancao  VARCHAR(45) NOT NULL,
      duracao INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id)
        REFERENCES album (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducao(
      momento DATETIME NOT NULL,
      cancao_id INT NOT NULL,
      usuario_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (cancao_id, usuario_id),
      FOREIGN KEY (cancao_id)
        REFERENCES cancao (cancao_id),
      FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.seguindo(
      usuario_id INT,
      artista_id INT,
      CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
      FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
      FOREIGN KEY (artista_id)
        REFERENCES artista (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plano (plano_id, plano, valor)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'universitário', 5.99),
    (3, 'pessoal', 6.99),
    (4, 'familiar', 7.99);

  INSERT INTO SpotifyClone.usuario (usuario_id, usuario, idade, assinatura, plano_id)
  VALUES
    (1, 'Barbara Liskov', 82, "2019-10-20", 1),
    (2, 'Robert Cecil Martin', 58, "2017-01-06", 1),
    (3, 'Ada Lovelace', 37, "2017-12-30", 1),
    (4, 'Martin Fowler', 46, "2017-01-17", 4),
    (5, 'Sandi Metz', 58, "2018-04-29", 4),
    (6, 'Paulo Freire', 19, "2018-02-14", 2),
    (7, 'Bell Hooks', 26, "2018-01-05", 2),
    (8, 'Christopher Alexander', 85, "2019-06-05", 3),
    (9, 'Judith Butler', 45, "2020-05-13", 3),
    (10, 'Jorge Amado', 58, "2017-02-17", 3);

  INSERT INTO SpotifyClone.artista (artista_id, artista)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');  

  INSERT INTO SpotifyClone.album (album_id, album, lancamento, artista_id)
  VALUES
    (1, 'Renaissance', 2022, 1),
    (2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'I Put A Spell On You', 2012, 6);

    INSERT INTO SpotifyClone.cancao (cancao_id, cancao, duracao, album_id)
  VALUES
    (1, 'Samba em Paris', 267, 6),
    (2, 'Virgo`s Groove', 369, 1),
    (3, 'Feeling Good', 100, 8),
    (4, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (5, 'Under Pressure', 152, 3),
    (6, 'Break My Soul', 279, 1),
    (7, 'Don`t Stop Me Now', 203, 2),
    (8, 'The Bard`s Song', 244, 7),
    (9, 'Alien Superstar', 116, 1),
    (10, 'Como Nossos Pais', 105, 4);  

  INSERT INTO SpotifyClone.reproducao (momento, cancao_id, usuario_id)
  VALUES
    ("2022-02-28 10:45:55", 1, 1),
    ("2020-05-02 05:30:35", 2, 1),
    ("2020-03-06 11:22:33", 3, 1),
    ("2022-08-05 08:05:17", 3, 2),
    ("2020-01-02 07:40:33", 4, 2),
    ("2020-11-13 16:55:13", 3, 3),
    ("2020-12-05 18:38:30", 2, 3),
    ("2021-08-15 17:10:10", 1, 4),
    ("2022-01-09 01:44:33", 1, 5),
    ("2020-08-06 15:23:43", 5, 5),
    ("2017-01-24 00:31:17", 4, 6),
    ("2017-10-12 12:35:20", 6, 6),
    ("2011-12-15 22:30:49", 7, 7),
    ("2012-03-17 14:56:41", 7, 8),
    ("2022-02-24 21:14:22", 8, 9),
    ("2015-12-13 08:30:22", 9, 10);

    INSERT INTO SpotifyClone.seguindo (usuario_id, artista_id)
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
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
