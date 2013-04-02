app_name = "ufcfit-oauth-provider"

deploy_key_item = Chef::EncryptedDataBagItem.load("deploy_keys", app_name)
app_item = Chef::EncryptedDataBagItem.load("apps", app_name)
database_item = app_item['database']

application app_name do
  path "/home/ubuntu/apps/#{app_name}"
  owner "ubuntu"
  group "ubuntu"

  environment_name 'production'
  migrate true

  repository "git@github.com:khurramzaman/ufc-oauth-provider.git"
  deploy_key deploy_key_item['deploy_key']

  rails do
    bundler true
    precompile_assets false

    database do
      adapter database_item['adapter']
      host database_item['host']
      database database_item['database']
      username database_item['username']
      password database_item['password']
      encoding database_item['encoding']
    end
  end

  nginx_load_balancer do
    server_name "ufc-api.test"
    only_if { node['roles'].include?("#{app_name}_load_balancer") }
  end
end
