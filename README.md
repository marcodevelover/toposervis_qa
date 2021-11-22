# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# toposervis

### migrate ###

rake db:seed                    # Load the seed data from db/seeds.rb, db/seeds/*.seeds.rb and db/seeds/ENVIRONMENT/*.seeds.rb. ENVIRONMENT is the current environment in Rails.env.
rake db:seed:bar                # Load the seed data from db/seeds/bar.seeds.rb
rake db:seed:common             # Load the seed data from db/seeds.rb and db/seeds/*.seeds.rb.
rake db:seed:development        # Load the seed data from db/seeds.rb, db/seeds/*.seeds.rb and db/seeds/development/*.seeds.rb.
rake db:seed:development:users  # Load the seed data from db/seeds/development/users.seeds.rb
rake db:seed:original           # Load the seed data from db/seeds.rb


### docker ###
