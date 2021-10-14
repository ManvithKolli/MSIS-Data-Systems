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

INSERT INTO referee (referee_id, referee_fname, year_published, publisher, pages, MSRP) VALUES 
  ("The Hobbit", "J. R. R. Tolkien", 1937, "George Allen & Unwin", 310, 15),
  ("How to Lie with Statistics", "Darrell Huff", 1954, "W. W. Norton & Company", 144, 9),
  ("The Monk Who Sold His Ferrari", "Robin Sharma", 1996, "Harper Collins Publishers", 198, 10),
  ("The Immortals of Meluha", "Amish Tripathi", 2010, "Westland Press", 390, 14),
  ("The 3 Mistakes of My Life", "Chetan Bhagat", 2008, "Rupa Publications", 258, 11);

-- SELECT * FROM book;