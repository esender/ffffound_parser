require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__

vk = VkontakteApi.authorization_url(type: :client, scope: [:friends, :photos])

p vk.token