#Minnie

After working with [Devise](https://github.com/plataformatec/devise) and [Clearance](https://github.com/thoughtbot/clearance), I started to play with [OmniAuth](https://github.com/intridea/omniauth). At the time, OmniAuth didn't have much support amongst the auth gems so I wrote my authentication code for it.  

Heavily inspired by [Ryan Bates' Railscast on Authentication from Scratch](http://railscasts.com/episodes/250-authentication-from-scratch), I wrote just enough code to have the authentication working.  I pulled a few other ideas out of Devise and Clearance and had [a decent looking gist](https://gist.github.com/753507) after a while.

Then I had to adapt the code for email/password logins.  And then LDAP authentication came up.  Eventually, I had refactored it down to the basics that could be reused multiple times.

But copying and pasting a gist into multiple apps gets tiresome quickly. So Minnie was born. I've added email/password authentication as the default strategy for Minnie. But feel free to also check out the [OmniAuth](https://github.com/mm53bar/minnie-omniauth-sample) and [LDAP](https://github.com/mm53bar/minnie-ldap-sample) strategies.

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

