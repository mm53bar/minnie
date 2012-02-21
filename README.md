#Minnie

###Install

Add minnie to your Gemfile

     gem 'minnie'

Run minnie's generator to get up and running

     bundle exec rails generate minnie:install

You're all done!  Log into the console and create a test user

     User.create :email => 'test@test.com', :password => 'test'

And then try to sign in to your app at [/signin](http://localhost:3000/signin).

###Issues

There isn't much code here so try resolving issues on your own. If you get some issues fixed, send me a pull request!

If you're not making any headway, just create an issue and I'll try to look at it.

