#
# Cookbook Name:: ufcfit-oauth-provider
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ufcfit-oauth-provider::postgresql"
include_recipe "ufcfit-oauth-provider::rails_app"
include_recipe "ufcfit-oauth-provider::thin"
