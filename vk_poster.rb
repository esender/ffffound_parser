require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__

vk = VkontakteApi::Client.new('ca298303adbb25e2536b5064760f94670a4232228bcc382e901e4abe86a6de7419f9e2fc82d5d5096a4ce')
# vk = VkontakteApi.authorize(type: :app_server)
p vk.wall.post(owner_id: -65617127)