app_name = "ufcfit-oauth-provider"

deploy_key_item = Chef::EncryptedDataBagItem.load("deploy_keys", app_name)
app_item = Chef::EncryptedDataBagItem.load("apps", app_name)
database_item = app_item['database']

application app_name do
  path "/home/ubuntu/apps/#{app_name}"
  owner "ubuntu"
  group "ubuntu"

  #strategy :timestamped_deploy
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

  #before_migrate do
    #template "#{shared_path}/database.yml" do
      #source "database.yml.erb"
      #owner "ubuntu"
      #group "ubuntu"
      #mode "644"
      #variables :config => app_item['database']
    #end

    #execute "ln -s ../../../shared/database.yml config/database.yml" do
      #user "ubuntu"
      #cwd release_path
    #end
  #end
end
