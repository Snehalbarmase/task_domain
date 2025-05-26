create type MovieRating as ENUM ('Good','Average','Bad')

create table movies (
movie_id serial primary key,
    title varchar(100) not null,
    release_year int,
    rating MovieRating 
)

insert into movies (title,release_year,rating) values 
('The Great Adventure',2023,'Good'),
('Mystery in the Park',2022,'Average'),
('Horror Night', 2024, 'Bad')

select * from movies

update movies set rating ='Good'
where title = 'Mystery in the Park'

select * from movies

select title, rating from movies 
where rating = 'Good'

select title, rating from movies
where rating >= 'Average'
order by rating DESC

alter type MovieRating add value 'MustSee' after 'Good'

alter type MovieRating rename value 'Bad' to 'Terrible'

insert into movies (title,release_year,rating) values 
('Epic Journey',2025,'MustSee')

select * from movies

select title, rating from movies where title = 'Horror Night'

select * from movies

create view top_rated_movies as
select movie_id,title,release_year,rating from movies
where rating >= 'Good'
order by rating DESC, release_year DESC

select * from top_rated_movies

