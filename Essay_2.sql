-- Create raw tables
CREATE TABLE raw_users (
user_id INT,
user_name VARCHAR(100),
country VARCHAR(50)
);
CREATE TABLE raw_posts (
post_id INT,
post_text VARCHAR(500),
post_date DATE,
user_id INT
);
CREATE TABLE raw_likes (
like_id INT,
user_id INT,
post_id INT,
like_date DATE
);
-- Insert sample data
INSERT INTO raw_users
VALUES
(1, 'john_doe', 'Canada'),
(2, 'jane_smith', 'USA'),
(3, 'bob_johnson', 'UK');
INSERT INTO raw_posts
VALUES
(101, 'My first post!', '2020-01-01', 1),
(102, 'Having fun learning SQL', '2020-01-02', 2),
(103, 'Big data is cool', '2020-01-03', 1),
(104, 'Just joined this platform', '2020-01-04', 3),
(105, 'Whats everyone up to today?', '2020-01-05', 2),
(106, 'Data science is the future', '2020-01-06', 1),
(107, 'Practicing my SQL skills', '2020-01-07', 2),
(108, 'Hows the weather where you are?', '2020-01-08', 3),
(109, 'TGI Friday!', '2020-01-09', 1),
(110, 'Any big plans for the weekend?', '2020-01-10', 2);
INSERT INTO raw_likes
VALUES
(1001, 1, 101, '2020-01-01'),
(1002, 3, 101, '2020-01-02'),
(1003, 2, 102, '2020-01-03'),
(1004, 1, 103, '2020-01-04'),
(1005, 3, 104, '2020-01-05'),
(1006, 2, 104, '2020-01-06'),
(1007, 1, 105, '2020-01-07'),
(1008, 2, 106, '2020-01-08'),
(1009, 3, 107, '2020-01-09'),
(1010, 1, 108, '2020-01-10'),
(1011, 2, 109, '2020-01-11'),
(1012, 3, 110, '2020-01-12');

--Please create dimension tables dim_user , dim_post , and dim_date to store normalized data from the raw tables
create table dim_user (
    user_id int primary key,
    username varchar(255),
    full_name varchar(255));
create table dim_post (
    post_id int primary key,
    user_id int,
    post_date date);
create table dim_date (
    date_id int primary key,
    calendar_date date);

--Populate the dimension tables by inserting data from the related raw tables
insert into dim_user values 
(1, 'john_doe', 'Canada'),
(2, 'jane_smith', 'USA'),
(3, 'bob_johnson', 'UK');

insert into dim_post values
(101, 'My first post!', '2020-01-01', 1),
(102, 'Having fun learning SQL', '2020-01-02', 2),
(103, 'Big data is cool', '2020-01-03', 1),
(104, 'Just joined this platform', '2020-01-04', 3),
(105, 'Whats everyone up to today?', '2020-01-05', 2),
(106, 'Data science is the future', '2020-01-06', 1),
(107, 'Practicing my SQL skills', '2020-01-07', 2),
(108, 'Hows the weather where you are?', '2020-01-08', 3),
(109, 'TGI Friday!', '2020-01-09', 1),
(110, 'Any big plans for the weekend?', '2020-01-10', 2);

insert into dim_date values
(1001, 1, 101, '2020-01-01'),
(1002, 3, 101, '2020-01-02'),
(1003, 2, 102, '2020-01-03'),
(1004, 1, 103, '2020-01-04'),
(1005, 3, 104, '2020-01-05'),
(1006, 2, 104, '2020-01-06'),
(1007, 1, 105, '2020-01-07'),
(1008, 2, 106, '2020-01-08'),
(1009, 3, 107, '2020-01-09'),
(1010, 1, 108, '2020-01-10'),
(1011, 2, 109, '2020-01-11'),
(1012, 3, 110, '2020-01-12');

--Create a fact table called fact_post_performance to store metrics like post views and likes over time
create table fact_post_performance (
    fact_id int primary key,
    post_id int,
    date_id int,
    views int,
    likes int,
);



