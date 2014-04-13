require 'vkontakte_api'
require File.expand_path '../vk_config.rb', __FILE__
require 'yaml'
require 'sqlite3'
require 'mechanize'

access = YAML.load_file(File.expand_path '../config/access.yml', __FILE__)

vk = VkontakteApi::Client.new(access['token'])

gif = '.gif'
temp_pic = 'temp/1.gif'
agent = Mechanize.new
db = SQLite3::Database.new( "ffffound.db" )

db.execute( "select * from images WHERE id IS 43 ORDER BY created_at ASC LIMIT 10" ) do |row|
	if row[1].include? gif
    agent.get(row[1]).save 'temp/pic.gif'
    temp_pic = 'temp/pic.gif'
    url = vk.docs.get_wall_upload_server(group_id: 65617127)
    p url
    #upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/gif'])
    #p upl
    #post_item = vk.docs.save(upl.merge({gid:65617127}))
    #vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))
  else
    #agent.get(row[1]).save 'temp/pic.jpg'
    #temp_pic = 'temp/pic.jpg'
    #url = vk.photos.get_wall_upload_server(group_id: 65617127)
    #upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/jpeg'])
    #post_item = vk.photos.save_wall_photo(upl.merge({gid:65617127}))
    #vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))
  end
  #db.execute( "UPDATE images SET posted = true WHERE id = #{row[0]}")
  #File.delete(temp_pic)
end

#url = vk.docs.get_wall_upload_server(group_id: 65617127)
#upl = VkontakteApi.upload(url: url[:upload_url], photo: [temp_pic, 'image/gif'])
#p post_item = vk.docs.save_wall_photo(upl.merge({gid:65617127}))
#vk.wall.post(owner_id: -65617127, attachments: post_item.map(&:id).join(','))