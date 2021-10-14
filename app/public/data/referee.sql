CREATE DATABASE IF NOT EXISTS project;
USE project;

DROP TABLE IF EXISTS referee;
CREATE TABLE referee (
    referee_id varchar(10) UNIQUE NOT NULL,
    referee_fname varchar(48),
    referee_age int(4),
    referee_grade varchar(4),
    referee_skill int(10),
    PRIMARY KEY (referee_id)
);

DROP TABLE IF EXISTS game;
CREATE TABLE gamee (
    game_number int(10) UNIQUE NOT NULL,
    game_type varchar(10),
    game_day date(10),
    game_time varchar(10),
    PRIMARY KEY (game_number)
);

DROP TABLE IF EXISTS assignment;
CREATE TABLE assignment (
    assignment_id varchar(7) UNIQUE NOT NULL,
    referee_id varchar(10),
    game_number int(10),
    referee_assign_status int(25),
    referee_grade varchar(4),
    referee_skill int(10),
    PRIMARY KEY (assignment_id),
    FOREIGN KEY (referee_id) REFERENCES referee(referee_id),
    FOREIGN KEY (game_number) REFERENCES game(game_number)
);

INSERT INTO referee (referee_id, referee_fname, referee_age, referee_grade, referee_skill) VALUES 
  (1, 'Tom', 35, 'AA', 90),
  (2, 'Alex', 40, 'A1', 85),
  (3,'Alan',45,'A2',95);

INSERT INTO game (game_number,game_type,game_day,game_time) VALUES
  (1, 'Club', '10/04/2021', '5:00 pm')
  (2, 'Middle School', '10/10/2021', '7:00 pm')
  (3, 'High School', '10/12/2021', '8:00 pm')

