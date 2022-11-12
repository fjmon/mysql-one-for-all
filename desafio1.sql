  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      assinatura DATE NOT NULL,
      plano VARCHAR(45) NOT NULL,
      valor DECIMAL(4,2) NOT NULL,      
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      artista VARCHAR(45) NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      album VARCHAR(45) NOT NULL,
      lancamento INT NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducao(
      momento_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      data DATETIME NOT NULL,
      hora VARCHAR(45) NOT NULL,
      cancao_id INT NOT NULL,
      usuario_id INT NOT NULL,
      FOREIGN KEY (cancao_id)
        REFERENCES cancao (cancao_id)
      FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancao(
      cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      cancao  VARCHAR(45) NOT NULL,
      duracao INT NOT NULL,
      album_id INT NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (album_id)
        REFERENCES album (album_id)
      FOREIGN KEY (artista_id)
        REFERENCES artista (artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
      FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id)
      FOREIGN KEY (artista_id)
        REFERENCES artista (artista_id)
  ) engine = InnoDB;
  

  INSERT INTO SpotifyClone.usuario (usuario_id, nome, idade, assinatura, plano, valor)
  VALUES
    (1, 'Barbara Liskov', 82, "2019-10-20", 'gratuito', 0.00),
    (2, 'Robert Cecil Martin', 58, "2017-01-06", 'gratuito', 0.00),
    (3, 'Ada Lovelace', 37, "2017-12-30", 'gratuito', 0.00),
    (4, 'Martin Fowler', 46, "2017-01-17", 'familiar', 7.99),
    (5, 'Sandi Metz', 58, "2018-04-29", 'familiar', 7.99),
    (6, 'Paulo Freire', 19, "2018-02-14", 'universitário', 5.99),
    (7, 'Bell Hooks', 26, "2018-01-05", 'universitário', 5.99),
    (8, 'Christopher Alexander', 85, "2019-06-05", 'pessoal', 6.99),
    (9, 'Judith Butler', 45, "2020-05-13", 'pessoal', 6.99),
    (10, 'Jorge Amado', 58, "2017-02-17", 'pessoal', 6.99);

  INSERT INTO SpotifyClone.artista (artista_id, artista)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');  

  INSERT INTO SpotifyClone.album (album_id, album, lancamento)
  VALUES
    (1, 'Renaissance', 2022),
    (2, 'Jazz', 1978),
    (3, 'Hot Space', 1982),
    (4, 'Falso Brilhante', 1998),
    (5, 'Vento de Maio', 2001),
    (6, 'QVVJFA?', 2003),
    (7, 'Somewhere Far Beyond', 2007),
    (8, 'I Put A Spell On You', 2012);

  INSERT INTO SpotifyClone.reproducao (momento_id, data, hora, cancao_id, usuario_id)
  VALUES
    (1, "2022-02-28", "10:45:55", 1, 1),
    (2, "2020-05-02", "05:30:35", 2, 1),
    (3, "2020-03-06", "11:22:33", 3, 1),
    (4, "2022-08-05", "08:05:17", 3, 2),
    (5, "2020-01-02", "07:40:33", 4, 2),
    (6, "2020-11-13", "16:55:13", 3, 3),
    (7, "2020-12-05", "18:38:30", 2, 3),
    (8, "2021-08-15", "17:10:10", 1, 4),
    (9, "2022-01-09", "01:44:33", 1, 5),
    (10, "2020-08-06", "15:23:43", 5, 5),
    (11, "2017-01-24", "00:31:17", 4, 6),
    (12, "2017-10-12", "12:35:20", 6, 6),
    (13, "2011-12-15", "22:30:49", 7, 7),
    (14, "2012-03-17", "14:56:41", 7, 8),
    (15, "2022-02-24", "21:14:22", 8, 9),
    (16, "2015-12-13", "08:30:22", 9, 10);  

    INSERT INTO SpotifyClone.cancao (cancao_id, cancao, duracao, album_id, artista_id)
  VALUES
    (1, 'Samba em Paris', 267, 6, 4),
    (2, 'Virgo`s Groove', 369, 1, 1),
    (3, 'Feeling Good', 100, 8, 6),
    (4, 'O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    (5, 'Under Pressure', 152, 3, 2),
    (6, 'Break My Soul', 279, 1, 1),
    (7, 'Don`t Stop Me Now', 203, 2, 2),
    (8, 'The Bard`s Song', 244, 7, 5),
    (9, 'Alien Superstar', 116, 1, 1),
    (10, 'Como Nossos Pais', 105, 4, 3);  

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
    (6, -),
    (7, 6),
    (8, -),
    (9, 3),
    (10, -);
