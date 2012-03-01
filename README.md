#Minnie

###Install

Add minnie to your Gemfile

     gem 'minnie'

Run minnie's generator to get up and running

     bundle exec rails generate minnie:install

Minnie ships with an email/password authentication strategy that uses [Rails' has_secure_password](https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb#L34). If that's the
way you to like to swing, just run the following:

     bundle exec rails generate minnie:install:user

Of course, you're free to implement your own authentication method in User.  Take a look at [the default strategy](https://github.com/mm53bar/minnie/blob/master/lib/minnie/user/auth.rb) or
[minnie's LDAP strategy](https://github.com/mm53bar/minnie-ldap/blob/master/lib/minnie/user/ldap.rb) for examples.

You're all done!  Log into the console and create a test user

     User.create :email => 'test@test.com', :password => 'test'

And then try to sign in to your app at [/signin](http://localhost:3000/signin).

###Issues

There isn't much code here so try resolving issues on your own. If you get some issues fixed, send me a pull request!

If you're not making any headway, just create an issue and I'll try to look at it.

