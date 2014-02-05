require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__
require 'yaml'
require 'sqlite3'

access = YAML.load_file(File.expand_path '../config/access.yml', __FILE__)

vk = VkontakteApi::Client.new(access['token'])
# vk = VkontakteApi.authorize(type: :app_server)
# p vk.wall.post(owner_id: -65617127, message: 'hi!')


# db = SQLite3::Database.new( "ffffound.db" )
# db.execute( "select * from images limit 25" ) do |row|
# 	url = vk.photos.get_wall_upload_server(group_id: 65617127)
# 	vk.upload(photo: [row, 'image/jpeg'])
# 	vk.wall.post(owner_id: -65617127, from_group: 1, )
# end
# p vk.photos.get_wall_upload_server(group_id: 65617127)
url = vk.photos.get_wall_upload_server(group_id: 65617127)
p "-"*100
p url
upl = VkontakteApi.upload(url: url[:upload_url], photo: ['/home/emil/rbpr/ffffound_parser/1.jpeg', 'image/jpeg'])
p "-"*100
p upl
p "-"*100
post_item = vk.photos.save_wall_photo(upl.merge({gid:65617127}))
vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','), message:'http://cs616024.vk.me/v616024415/27e6/vyY28WfiETw.jpg')