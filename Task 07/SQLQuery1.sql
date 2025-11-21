CREATE DATABASE Task;
GO

USE Task;
GO

-- SCHEMA
CREATE SCHEMA movie;
GO

-- ========================
--       Actor Table
-- ========================
CREATE TABLE movie.actor
(
  act_id INT NOT NULL PRIMARY KEY,
  act_fname VARCHAR(20) NOT NULL,
  act_lname VARCHAR(20) NOT NULL,
  act_gender VARCHAR(1) NOT NULL
);
GO

-- ========================
--       Director Table
-- ========================
CREATE TABLE movie.director
(
  dir_id INT NOT NULL PRIMARY KEY,
  dir_fname VARCHAR(20) NOT NULL,
  dir_lname VARCHAR(20) NOT NULL
);
GO

-- ========================
--        Movie Table
-- ========================
CREATE TABLE movie.movie
(
  mov_id INT NOT NULL PRIMARY KEY,
  mov_title VARCHAR(50) NOT NULL,
  mov_year INT NOT NULL,
  mov_time INT NOT NULL,
  mov_lang VARCHAR(50) NOT NULL,
  mov_dt_rel DATE NOT NULL,
  mov_rel_country VARCHAR(5) NOT NULL
);
GO

-- ========================
--      Movie Cast
-- ========================
CREATE TABLE movie.movie_cast
(
  act_id INT NOT NULL,
  mov_id INT NOT NULL,
  role VARCHAR(30),
  FOREIGN KEY (act_id) REFERENCES movie.actor(act_id),
  FOREIGN KEY (mov_id) REFERENCES movie.movie(mov_id)
);
GO

-- ========================
--        Genres
-- ========================
CREATE TABLE movie.genres
(
  gen_id INT NOT NULL PRIMARY KEY,
  gen_title VARCHAR(20) NOT NULL
);
GO

-- ========================
--     Movie Genres
-- ========================
CREATE TABLE movie.movie_genres
(
  mov_id INT NOT NULL,
  gen_id INT NOT NULL,
  FOREIGN KEY (mov_id) REFERENCES movie.movie(mov_id),
  FOREIGN KEY (gen_id) REFERENCES movie.genres(gen_id)
);
GO

-- ========================
--      Reviewer Table
-- ========================
CREATE TABLE movie.reviewer
(
  rev_id INT NOT NULL PRIMARY KEY,
  rev_name VARCHAR(30) NOT NULL
);
GO

-- ========================
--        Rating
-- ========================
CREATE TABLE movie.rating
(
  rev_stars INT NOT NULL,
  num_o_ratings INT NOT NULL,
  mov_id INT NOT NULL,
  rev_id INT NOT NULL,
  FOREIGN KEY (mov_id) REFERENCES movie.movie(mov_id),
  FOREIGN KEY (rev_id) REFERENCES movie.reviewer(rev_id)
);
GO

-- ========================
--    Movie Direction
-- ========================
CREATE TABLE movie.movie_direction
(
  dir_id INT NOT NULL,
  mov_id INT NOT NULL,
  FOREIGN KEY (dir_id) REFERENCES movie.director(dir_id),
  FOREIGN KEY (mov_id) REFERENCES movie.movie(mov_id)
);
GO