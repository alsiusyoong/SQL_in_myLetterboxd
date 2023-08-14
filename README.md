# Star Schemas, ERDs, Letterboxd
I have been reading The Data Warehouse Toolkit (3rd Edition) by Ralph Kimball to learn more about data warehouses. As I am a huge fan of the movies, I have been using Letterboxd to log all the films that I have watched. So, I came up with my own ERD diagrams of a star schema of Letterboxd and practiced writing some SQL queries. Letterboxd is a social platform for sharing your taste in film. You can use it as a diary to record your opinion about films as you watch them, or just keep track of films that you have watched. It is described as ‘like GoodReads for movies’.

# My take on an ERD diagram of Letterboxd

I focused on the core functionality aspect of it: what a user can do with a film or a follower, and the characteristics of a film.
This relational database model is aimed at helping the data team at Letterboxd better understand users’ activeness lifestyle. There were a few many to many (M:N) relationships which were resolved by inserting an associative table between the respective entities. Each entity is created as a single table, and includes all the relevant keys and other information.

![alt text](https://github.com/alsiusyoong/SQL_in_myLetterboxd/blob/main/My%20take%20on%20the%20ERD%20Diagram%20of%20Letterboxd.png)

Using this ERD diagram, I wanted to practice writing SQL queries so I came up with 2 questions.
1. Given the follow_list, find all profiles that are mutually following each other.
I used a temp table for this and used UNION ALL to get all the possible combinations. I had to join one more time using t3 to find the followers for each user_id. I don’t have fake data for this so I’m not sure if the syntax is correct.

2. I am interested in seeing which film has the most likes in each film genre. A well-liked movie in a genre is a film which has a like count in the top 3 unique like counts for that genre. Find the well-liked movies in each of the departments.
I used a temp table for this to create the view with the ranking of the number of likes. The view is then completed by doing the necessary joins based on my ERD diagram. Thereafter, the second SELECT query is used to query the temp table with the necessary filters. In this case, that is the WHERE Like_Rank < 4.
