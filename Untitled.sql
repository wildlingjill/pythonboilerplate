select * from users;

select * from friends;

select users.alias, users.id
from users 
where id not in (
   select friend_id as id from friends 
   where user_id = 2
);

select users.alias, users.id from users
left join friends
on users.id = friends.user_id
where friends.user_id = 6;

select users.alias, users.id
from users
left join friends
on users.id = friends.user_id
left join users as users2
on friends.friend_id = users2.id
where friends.user_id = 6;

select users.alias, users.id, friend.user_id, friend.friend_id
from users
left join friends
on users.id = friends.user_id;


   select friend_id as id from friends 
   where user_id = 2;