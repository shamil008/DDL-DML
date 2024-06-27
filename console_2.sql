create table authors(
    author_id BIGSERIAL primary key ,
    about varchar(1024),
    nick varchar(256)
);

create table posts(
    post_id BIGSERIAL primary key ,
    post_name varchar(256)
);

INSERT INTO authors (about, nick) VALUES
                                      ('Author of several science fiction novels', 'SciFiAuthor'),
                                      ('Writes about technology and society', 'TechWriter'),
                                      ('Famous for historical fiction', 'HistoryBuff');

INSERT INTO posts (post_name) VALUES
                                  ('The Rise and Fall of Ancient Civilizations'),
                                  ('Quantum Physics: An Introduction'),
                                  ('The Impact of the Industrial Revolution'),
                                  ('Exploring the Solar System'),
                                  ('The History of World War II'),
                                  ('Genetic Engineering: Pros and Cons'),
                                  ('Medieval Europe: Society and Culture'),
                                  ('The Theory of Relativity'),
                                  ('Renaissance Art and Artists'),
                                  ('Climate Change and Its Effects');

create table authors_posts(
    id BIGSERIAL primary key ,
    authors_id INTEGER references authors(author_id),
    posts_id Integer references  posts(post_id)
);
-- ManyToMany
select a.nick,a.about,p.post_name from authors a inner join authors_posts ap on a.author_id = ap.authors_id
inner join posts p on ap.posts_id = p.post_id;

create table subscirbers(
    subscriber_id BIGSERIAL primary key ,
    subscriber_name varchar(256),
    email varchar(256) NOT NULL
);
alter table authors add CONSTRAINT unique_nick unique(nick);

alter table authors add COLUMN email varchar(256);

alter table authors add CONSTRAINT  unique_email unique(email);

alter table posts add COLUMN  img_url varchar(256);

create table  tags(
    tag_id bigserial primary key ,
    tag varchar(256)
);

create table post_tags(
    id bigserial primary key ,
    post_id Integer references posts(post_id),
    tag_id INTEGER references tags(tag_id)
);

Select p.post_name,p.img_url,t.tag from posts p inner join post_tags pt on p.post_id = pt.post_id
inner join tags t on pt.tag_id = t.tag_id;

alter table tags add CONSTRAINT unique_tag UNIQUE (tag);
alter table tags drop constraint unique_tag;

