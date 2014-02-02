require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__
require 'yaml'

access = YAML.load_file(File.expand_path '../config/access.yml', __FILE__)

vk = VkontakteApi::Client.new(access['token'])
# vk = VkontakteApi.authorize(type: :app_server)
p vk.wall.get(owner_id: -65617127)
