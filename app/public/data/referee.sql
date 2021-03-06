CREATE DATABASE IF NOT EXISTS project;
USE project;

DROP TABLE IF EXISTS referee;
CREATE TABLE referee (
    referee_id varchar(10) UNIQUE NOT NULL,
    referee_fname varchar(48),
    referee_age int(100),
    referee_grade varchar(4),
    referee_skill int(100),
    PRIMARY KEY (referee_id)
);

DROP TABLE IF EXISTS game;
CREATE TABLE game (
    game_number int(10) UNIQUE NOT NULL,
    game_type varchar(10),
    game_day date,
    game_time varchar(10),
    PRIMARY KEY (game_number)
);

DROP TABLE IF EXISTS assignment;
CREATE TABLE assignment (
    assignment_id varchar(7) UNIQUE NOT NULL,
    referee_id varchar(10) REFERENCES referee(referee_id),
    game_number int(10) REFERENCES game(game_number),
    referee_assign_status int(25),
    PRIMARY KEY (assignment_id)
    );

INSERT INTO assignment (assignment_id, referee_id, game_number, referee_assign_status) VALUES 
  (1, 2, 3, 'Assigned'),
  (2, 3, 1, 'Assigned'),
  (3, 0 ,2,'Unassigned');

INSERT INTO referee (referee_id, referee_fname, referee_age, referee_grade, referee_skill) VALUES 
  (1, 'Tom', 35, 'AA', 90),
  (2, 'Alex', 40, 'A1', 85),
  (3,'Alan',45,'A2',95);

INSERT INTO game (game_number,game_type,game_day,game_time) VALUES
  (1, 'Club', '2021-10-04', '5:00 pm'),
  (2, 'Middle School', '2021-10-10', '7:00 pm'),
  (3, 'High School', '2021-10-12', '8:00 pm');
