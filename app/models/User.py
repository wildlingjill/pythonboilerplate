from system.core.model import Model
import re
class User(Model):
	def __init__(self):
		super(User, self).__init__()

	def get_user_by_email(self, email):
		query = "SELECT id, name, alias, email, password FROM users WHERE email = :email"
		data = { 
			'email': email
		}
		user = self.db.query_db(query, data)
		if user:
			return user[0]
		else:
			return None

	def get_user_by_id(self, user_id):
		query = "SELECT name, alias, email, password FROM users WHERE id = :id"
		data = { 
			'id': user_id
		}
		user = self.db.query_db(query, data)
		if user:
			return user[0]
		else:
			return None

	def validate(self, user):
		email_regex = re.compile(r"^[^@]+@[^@]+\.[^@]+$")
		errors = []
		if not user['name']:
			errors.append('Name cannot be blank')
		elif not user['alias']:
			errors.append('Please provide an alias for yourself')
		elif len(user['name']) < 2 or len(user['alias']) < 2:
			errors.append('Name and alias must be at least 2 characters long')
		if not user['email']:
			errors.append('Email cannot be blank')
		elif not email_regex.match(user['email']):
			errors.append('Email format is not valid!')
		if not user['password']:
			errors.append('Password cannot be blank')
		elif len(user['password']) < 8:
			errors.append('Password must be at least 8 characters long')
		elif user['password'] != user['c_password']:
			errors.append('Password and confirmation do not match')		
		return errors
		

	def add_user(self, user):
		errors = self.validate(user)
		registered = self.get_user_by_email(user['email'])
		if registered:
			errors.append('This email address is already registered!')
		if errors:
			return {"status": False, "errors": errors}
		else:
			password_hash = self.bcrypt.generate_password_hash(user['password'])
			query = "INSERT INTO users (name, alias, email, password, birthday, created_at) VALUES (:name, :alias, :email, :password, :birthday, NOW())"
			data = { 
				'name': user['name'],
				'alias': user['alias'], 
				'email': user['email'],
				'password': password_hash,
				'birthday': user['birthday']
			}
			self.db.query_db(query, data)
			return { "status": True }

	# def update_user(self, user):
	# 	errors = self.validate(user)
	# 	if errors:
	# 		return {"status": False, "errors": errors}
	# 	else:
	# 		password_hash = self.bcrypt.generate_password_hash(user['password'])
	# 		query = "UPDATE users SET name=:name, alias=:alias, email=:email, password=:password WHERE email = :email"
	# 		data = { 
	# 			'name': user['name'], 
	# 			'alias': user['alias'], 
	# 			'email': user['email'],
	# 			'password': password_hash
	# 		}
	# 		self.db.query_db(query, data)
	# 		return { "status": True }

	def add_friend(self, user_id, friend_id):
		query = """INSERT into friends (user_id, friend_id) values (:user_id, :friend_id);
		INSERT into friends (user_id, friend_id) values (:friend_id, :user_id);"""
		data = { 
			'user_id' : user_id,
			'friend_id' : friend_id
		}
		self.db.query_db(query, data)

	def remove_friend(self, user_id, friend_id):
		query = """DELETE from friends where friend_id = :friend_id;
		DELETE from friends where friend_id = :user_id"""
		data = { 
			'user_id' : user_id,
			'friend_id' : friend_id
		}
		self.db.query_db(query, data)


	def get_nonfriends(self, user_id):
		query = """SELECT * from users 
				where id not in 
				(SELECT friends.friend_id from friends 
				where friends.user_id = :user_id) 
				and users.id != :user_id"""
		data = { 
			'user_id': user_id
		}
		nonfriends = self.db.query_db(query, data)
		print nonfriends
		return nonfriends


	def get_friends(self, user_id):
		query = """SELECT users.alias, users.id from friends
				left join users
				on friends.friend_id = users.id
				where friends.user_id = :user_id"""
		data = { 
			'user_id': user_id
		}
		friends = self.db.query_db(query, data)
		return friends


	def delete_user(self, email):
		query = "DELETE FROM users WHERE email = :email"
		data = { "email": email }
		return self.db.query_db(query, data)



