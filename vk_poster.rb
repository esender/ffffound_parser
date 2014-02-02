require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__
require 'yaml'
require 'sqlite3'

access = YAML.load_file(File.expand_path '../config/access.yml', __FILE__)

vk = VkontakteApi::Client.new(access['token'])
# vk = VkontakteApi.authorize(type: :app_server)
p vk.wall.get(owner_id: -65617127)


# db = SQLite3::Database.new( "ffffound.db" )
# db.execute( "select * from images limit 25" ) do |row|
# 	url = 'http://cs303110.vkontakte.ru/upload.php?act=do_add'
# 	vk.upload(url: url, photo: ['row', 'image/jpeg'])
# 	vk.wall.post(owner_id: -65617127, from_group: 1, )
# end
