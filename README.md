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

### Comandos basicos para iniciar un proyecto en ruby on rails

gem install bundler;

bundle check || bundle install;

bundle exec rake db:migrate;

yarn install --check-files;

rm -fr tmp/pids/server.pid && bundle exec rails s -p 3000 -b 0.0.0.0;

### docker

Asegurate de que este creado el siguiente archivo:
- config/database.yml.example.yml -> config/database.yml

Si estas creando los contenedores por primera vez o necesitas volver a generarlos asegurate de borrar primero los siguientes archivos:
- package-lock.json Gemfile.lock yarn.lock

Para iniciar los contenedores ejecuta:
- docker-compose up

Host app:
- localhost:3000

Host datos:
- localhost:13306

** Importante cargar seeds antes de trabajar.

### seeds (Registros que deben ser precargados en la base de datos para trabajar)

rake db:seed                    # Load the seed data from db/seeds.rb, db/seeds/*.seeds.rb and db/seeds/ENVIRONMENT/*.seeds.rb. ENVIRONMENT is the current environment in Rails.env.
rake db:seed:bar                # Load the seed data from db/seeds/bar.seeds.rb
rake db:seed:common             # Load the seed data from db/seeds.rb and db/seeds/*.seeds.rb.
rake db:seed:development        # Load the seed data from db/seeds.rb, db/seeds/*.seeds.rb and db/seeds/development/*.seeds.rb.
rake db:seed:development:users  # Load the seed data from db/seeds/development/users.seeds.rb
rake db:seed:original           # Load the seed data from db/seeds.rb

Los seed estan alojados en la carpeta db/seeds/*.seeds.rb (20211119_1600.seeds.rb)

** cuando la base de datos no tiene ningun registro ejecutamos:
- docker exec -it toposervis_app bash -c "bundle exec rake db:seed"

** cuando la base de datos tiene registros y hay algun seed sin cargar ejecutamos:
- docker exec -it toposervis_app bash -c "bundle exec rake db:seed:20211119_1630"

** Ejecutar dentro de la base de datos los archivos en la carpeta "db/sql/*.sql" si los hay.

