include_recipe "postgresql::server"
include_recipe "postgresql::server_dev"
include_recipe "postgresql::libpq"

app_name = "ufcfit-oauth-provider"
app_item = Chef::EncryptedDataBagItem.load("apps", app_name)
database_item = app_item['database']

pg_user database_item['username'] do
  privileges :superuser => false, :createdb => false, :login => true
  password database_item['password']
end

pg_database database_item['database'] do
  owner "postgres"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end
