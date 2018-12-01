CREATE DATABASE quiz2;
drop table movie;
drop table rating;
CREATE TABLE movie(
mID INT PRIMARY KEY,
title VARCHAR(255),
year INT,
directop VARCHAR(255)
);
drop table reviewer;
CREATE TABLE reviewer(
rID INT PRIMARY KEY,
name VARCHAR(255)
);
drop table rating;
CREATE TABLE rating(
rID INT REFERENCES Reviewer,
mID INT REFERENCES movie,
stars INT,
ratingDate DATE
);

INSERT into movie values (101,'Gone with the Wind', 1939, 'Victor Fleming');
insert into movie values (102,'Star Wars', 1977, 'George Lucas');
insert into movie values (103,'The Sound of Music', 1965, 'Robert Wise');
insert into movie values (104,'E.T.', 1982, 'Steven Spielberg');
insert into movie values (105,'Titanic', 1997, 'James Cameron');
insert into movie values (106,'Snow White', 1937, null );
insert into movie values (107,'Avatar', 2009, 'James Cameron');
insert into movie values (108,'Raiders of the Lock Ark', 1981, 'Steven Spielberg');

insert into reviewer values (201, 'Sarah Martinez');
insert into reviewer values (202, 'Daniel Lewis');
insert into reviewer values (203, 'Brittany Harris');
insert into reviewer values (204, 'Mike Anderson');
insert into reviewer values (205, 'Chris Jackson');
insert into reviewer values (206, 'Elizabeth Thomas');
insert into reviewer values (207, 'James Cameron');
insert into reviewer values (208, 'Ashley White');

insert into rating values (201,101,2,'2011-01-22');
insert into rating values (201,101,4,'2011-01-27');
insert into rating values (202,106,4,null );
insert into rating values (203,103,2,'2011-01-20');
insert into rating values (203,108,2,'2011-01-30');
insert into rating values (203,108,4,'2011-01-12');
insert into rating values (204,101,3,'2011-01-09');
insert into rating values (205,103,3,'2011-01-27');
insert into rating values (205,104,2,'2011-01-22');

select *
from rating;




select *
from no_rating;


select title, avg(stars) as avst  from rating join movie on movie.mID = rating.mID group by movie.mID order by avst desc, title;

select title, min(stars) as minst from rating INNER join movie on movie.mID = rating.mID group by movie.mID order by title;

select name from reviewer where rID = (select rID from rating Where ratingDate isnull );

create materialized view no_rating as select title from movie where mID not in(select mID from rating) with data ;

