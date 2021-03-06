from system.core.model import Model
import re
from datetime import datetime
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
		query = "SELECT alias FROM users WHERE id = :id"
		data = { 
			'id': user_id
		}
		user = self.db.query_db(query, data)
		return user
		

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
		if not user['birthday']	:
			errors.append('Please select your birthday')	
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
				'birthday': datetime.strptime(user['birthday'], "%Y-%m-%d")
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

	def add_quote(self, user_id, quote_id):
		query = "INSERT into favourites (user_id, quote_id) values (:user_id, :quote_id)"
		data = { 
			'user_id' : user_id,
			'quote_id' : quote_id
		}
		self.db.query_db(query, data)


	def submit_quote(self, user_id, content, quoted):
		quote = quoted + ': ' + content
		query= "INSERT into quotes (author_id, content) values (:author_id, :quote)"
		data = {
			'author_id': user_id,
			'quote': quote
		}
		self.db.query_db(query, data)

	def remove_quote(self, favourite_id):
		query = "DELETE from favourites where favourites.id = :favourite_id"
		data = { 
			'favourite_id' : favourite_id
		}
		self.db.query_db(query, data)


	def get_quotes(self, user_id):
		query = """SELECT * from quotes where id not in 
				(select favourites.quote_id from favourites where favourites.user_id = :user_id)"""
		data = { 
			'user_id': user_id
		}
		quotes = self.db.query_db(query, data)
		for quote in quotes:
			author = self.get_user_by_id(quote['author_id'])
		print quotes
		return quotes


	def get_favourites(self, user_id):
		query = """SELECT users.alias, users.id, favourites.id, quotes.content, quotes.author_id from users
				left join favourites
				on users.id = favourites.user_id
				left join quotes
				on favourites.quote_id = quotes.id
				where favourites.user_id = :user_id"""
		data = { 
			'user_id': user_id
		}
		favourites = self.db.query_db(query, data)
		return favourites




