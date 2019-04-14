# Aqueduct CRUD

This is a CRUD Aqueduct framework project. What's in the project?

 - Making CRUD requests
 - Basic pagination

For accompanying article explaning how to get to an end result like this, kindly check out the "[Getting Started with the Aqueduct Framework - From Beginner to Intermediate](https://blog.khophi.co/getting-started-with-the-aqueduct-framework-from-beginner-to-intermediate/)", written by [@nkansahrexford](https://mobile.twitter.com/nkansahrexford). Learn more about what I do on [my website](https://khophi.co)

## Running the Application Locally

To get up and running locally, do these pre-requisites.

### Setting up environment

 - [Install Dart](https://webdev.dartlang.org/tools/sdk#install)
 - [Install Postgres Database](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
 - [Install Aqueduct](https://aqueduct.io/docs/getting_started/)
 - Clone this repository [Aqueduct-CRUD](https://github.com/seanmavley/aqueduct-crud)

### Setting up Database

Create a postgreSQL database, call it anything you want. 

```
  $ sudo -u postgres psql
  > CREATE USER projectuser WITH PASSWORD 'password';
  > CREATE DATABASE mydatabase;
  > GRANT ALL PRIVILEGES ON DATABASE mydatabase TO projectuser;
  > \q
```

Then create a `database.yaml` file in the root project (same location as the `pubspec.yaml`), and put in these:

```
username: 'projectuser'
password: 'password'
host: 'localhost'
port: 5432
databaseName: 'mydatabase'
```

### Migration

Last but not least, run the migration, to convey what database scheme we have and want to the database for real. You can check the `migrations/00000001_initial.migration.dart` file to see what is gonna happen.

Also, seed/fixture data is added.

Run `aqueduct db upgrade` to commit the migration to database.

### Run Application

 - In the project root folder, run `aqueduct serve`

Since this project is API endpoints only, you'll have to consume using a REST Client, such as [Postman](https://www.getpostman.com/).

If using Postman, [check out this API request collection](https://www.getpostman.com/collections/b5c30941ce917a3a2ca9) to help you get started with consuming your endpoints

## Running Application Tests

To run all tests for this application, run the following in this directory:

```
pub run test
```

The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## Deploying an Application

See the documentation for [Deployment](https://aqueduct.io/docs/deploy/).