USE r4rmusic1_development;
DROP TABLE IF EXISTS works;
DROP TABLE IF EXISTS editions;
DROP TABLE IF EXISTS composers;

CREATE TABLE works (
  id INT(11) NOT NULL AUTO_INCREMENT,
  composer_id INT(11),
  title VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE composers (
  id INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(25),
  last_name VARCHAR(25),
  PRIMARY KEY (id)
);

CREATE TABLE editions (
  id INT(11) NOT NULL AUTO_INCREMENT,
  work_id INT(11) NOT NULL,
  description VARCHAR(30),
  publisher VARCHAR(60),
  year INT(4),
  price FLOAT,
  PRIMARY KEY  (id)
);


INSERT INTO composers VALUES (1,"Johannes","Brahms");
INSERT INTO composers VALUES (2,"Claude","Debussy");

INSERT INTO works VALUES (1,1,"Sonata for Cello and Piano in F
Major");
INSERT INTO works VALUES (2,2,"String Quartet");

INSERT INTO editions VALUES (1,1,"Facsimile","D. Black Music House",
1998, 21.95);
INSERT INTO editions VALUES (2,1,NULL,"RubyTunes, Inc.", 1977,
23.50);
INSERT INTO editions VALUES (3,1,"ed. Y.Matsumoto","RubyTunes, Inc.",
2001, 22.95);
INSERT INTO editions VALUES (4,2,"ed. R.O'Rails","D. Black Music House", 1995,
39.95);
INSERT INTO editions VALUES (5,2,"Reprint of 1894 ed.", "RubyTunes,
Inc.", 2003, 35.95);

