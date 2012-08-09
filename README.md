Ad_man
======

Ad_man is an advertising manager mountable engine.  It allows the user to upload and manage advertising banners, and provides an easy to use helper for inserting the banners on your website.  Also counts the number of times an ad has shown, and the user can set a keyword for each ad.

Currently supports two image sizes for advertising: Leaderboard 728 x 90 and Banner 468 x 60. 
TODO: Will implement 9 different sizes as mentioned by google's adwords requirements.

add_dependency "paperclip", "~> 3.1.2"
Uses Paperclip, and requires ImageMagick be running on the server.

## Getting started

dependency "rails", "~> 3.2.7"
Ad_man works with Rails 3.2 onwards. You can add it to your Gemfile with:

```ruby
gem 'ad_man'
```

