from system.core.controller import *


class Users(Controller):
	def __init__(self, action):
		super(Users, self).__init__(action)
		self.load_model('User')

	def index(self):
		return self.load_view('index.html')


	def login(self):
		email = request.form['email']
		password = request.form['password']
		user = self.models['User'].get_user_by_email(email)
		if not user:
			flash('This email address has not been registered')
			return redirect('/')
		elif not self.models['User'].bcrypt.check_password_hash(user['password'], password):
			flash('Information given does not match login credentials!')
			return redirect('/')
		else:
			session['email'] = email
			session['id'] = user['id']
			session['success'] = 'logged in'
			return redirect('/friends')


	def register(self):
		user_info = {
			"name" : request.form['name'],
			"alias" : request.form['alias'],
			"email" : request.form['email'],
			"password" : request.form['password'],
			"c_password" : request.form['c_password'],
			"birthday" : request.form['birthday']
		}
		validations = self.models['User'].add_user(user_info)
		if validations['status'] == False:
			for message in validations['errors']:
				flash(message, 'error')
				return redirect('/')
		else:
			session["email"] = request.form['email']
			user = self.models['User'].get_user_by_email(session['email'])
			session['id'] = user['id']
			session['success'] = 'registered'   
			return redirect('/friends')


	def friends(self):
		user = self.models['User'].get_user_by_email(session["email"])
		session['alias'] = user['alias']
		friends = self.models['User'].get_friends(user['id'])
		if not friends:
			flash("You don't have any friends yet!")
		else:
			flash("Here is the list of your friends:")
		nonfriends = self.models['User'].get_nonfriends(user['id'])
		return self.load_view('friends.html', nonfriends=nonfriends, name=session['alias'], friends=friends)


	def add_friend(self, friend_id):
		self.models['User'].add_friend(session['id'], friend_id)
		return redirect('/friends')


	def view_user(self, user_id):
		user = self.models['User'].get_user_by_id(user_id)
		return self.load_view('viewfriend.html', user=user)


	def delete(self, friend_id):
		self.models['User'].remove_friend(session['id'], friend_id)
		flash('Successfully unfriended')
		return redirect('/friends')


	def logout(self):
		session.clear()
		flash('You are now logged out')
		return redirect('/')




