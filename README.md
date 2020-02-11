# BoxApp

[![CircleCI](https://circleci.com/gh/niharikabhoi2020/BoxApp.svg?style=svg)](https://circleci.com/gh/niharikabhoi2020/BoxApp)

[![Maintainability](https://api.codeclimate.com/v1/badges/3595d9ea6ac4c6f5512c/maintainability)](https://codeclimate.com/github/MayurDeshmukh10/BoxApp/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/3595d9ea6ac4c6f5512c/test_coverage)](https://codeclimate.com/github/MayurDeshmukh10/BoxApp/test_coverage)

<h4> Ruby Version - 2.6.5 </h4>
<h4> Rails Version - 6.0 </h4>

# Postgres Database Installation

1. Add PostgreSQL Apt Repository </br>
  <code> sudo apt-get install wget ca-certificates </code></br>
  <code> wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - </code>
2. Add the repository to your system </br>
  <code> RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list </code>
  
3. Install PostgreSQL </br>
  <code> sudo apt-get update </code></br>
  <code> sudo apt -y install postgresql-11 </code> </br>
  
# Configuration of Postgres for Rails

1. Go to /etc/postgresql/11/main directory
2. Change permission of pg_hba.conf file </br>
  <code> sudo chmod 777 pg_hba.conf </code>
3. Open pg_hba.conf file </br>
  Change <code>peer</code> to <code>md5</code> in <code>"local" is for Unix domain socket connections only</code> line and save the file.
  
4. Change password of postgres role </br>
  <code> sudo su - postgres </code> </br>
  <code> psql </code>
  <code> \password </code></br>
  enter new password
  
5. Create a new role for test database </br>
  <code> sudo su - postgres </code> </br>
  <code> psql </code>  </br>
  <code> CREATE ROLE role_name WITH PASSWORD "your_password"; </code> </br>
  <code> ALTER ROLE role_name WITH superuser; </code> </br>
  
6. Bundle Install 
    If pg gemfile error occurs use </br>
    <code> sudo apt-get install libpq-dev </code>

7. Set up Env Variables </br>
   Add these lines in .bashrc file </br>
   <code>export LEVEL_ME_UP_USERNAME="postgres"</code></br>
   <code> LEVEL_ME_UP_PASSWORD="your_password_set_in_step_4" </code></br>
   <code> POSTGRES_11_PORT="5432"</code></br>
   <code>export LEVEL_ME_UP_DEV="database_name"</code></br>
  
8. Create Database </br>
    Go to project directory </br>
    <code> rails db:create </code>

9. Run Migration </br>
    <code> rails db:migrate </code>
