app_name = "ufcfit-oauth-provider"
deploy_key_item = Chef::EncryptedDataBagItem.load("deploy_keys", app_name)

application app_name do
  path "/home/ubuntu/apps/#{app_name}"
  owner "ubuntu"
  group "ubuntu"

  repository "git@github.com:khurramzaman/ufc-oauth-provider.git"
  deploy_key deploy_key_item['deploy_key']

  rails do
    bundler true
    precompile_assets false
  end
end
