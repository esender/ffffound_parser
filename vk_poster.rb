require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__
require 'yaml'
require 'sqlite3'
require 'mechanize'

access = YAML.load_file(File.expand_path '../config/access.yml', __FILE__)

vk = VkontakteApi::Client.new(access['token'])
# vk = VkontakteApi.authorize(type: :app_server)
# p vk.wall.post(owner_id: -65617127, message: 'hi!')


# url = vk.photos.get_wall_upload_server(group_id: 65617127)
# p "-"*100
# p url
# upl = VkontakteApi.upload(url: url[:upload_url], photo: ['/home/emil/rbpr/ffffound_parser/1.jpeg', 'image/jpeg'])
# p "-"*100
# p upl
# p "-"*100
# post_item = vk.photos.save_wall_photo(upl.merge({gid:65617127}))
# vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','), message:'http://cs616024.vk.me/v616024415/27e6/vyY28WfiETw.jpg')
# p vk.photos.get_wall_upload_server(group_id: 65617127)
gif = '.gif'
jpg = '.jpg'
temp_pic = 'temp/1.gif'
agent = Mechanize.new
db = SQLite3::Database.new( "ffffound.db" )

db.execute( "select * from images limit 25" ) do |row|
	if gif.include? File.extname(row[1])
		agent.get(row[1]).save 'temp/pic.gif'
		temp_pic = 'temp/pic.gif'
		url = vk.photos.get_wall_upload_server(group_id: 65617127)
		upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/gif'])
		post_item = vk.photos.save_wall_photo(upl.merge({gid:65617127}))
		vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))
	else
		agent.get(row[1]).save 'temp/pic.jpg'
		temp_pic = 'temp/pic.jpg'
		url = vk.photos.get_wall_upload_server(group_id: 65617127)
		upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/jpeg'])
		post_item = vk.photos.save_wall_photo(upl.merge({gid:65617127}))
		vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))
	end
	File.delete(temp_pic)
end

# url = vk.photos.get_wall_upload_server(group_id: 65617127)
# upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/jpeg'])
# post_item = vk.photos.save_wall_photo(upl.merge({gid:65617127}))
# vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))
url = vk.docs.get_wall_upload_server(group_id: 65617127)
upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/gif'])
p post_item = vk.docs.save_wall_photo(upl.merge({gid:65617127}))
vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))