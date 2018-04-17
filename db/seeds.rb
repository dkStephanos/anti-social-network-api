def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

10.times do
	login = Faker::Twitter.screen_name
	userName = Faker::Name.name
	avatar = Faker::Avatar.image
	bio = Faker::HitchhikersGuideToTheGalaxy.marvin_quote

	user = User.create(login: login, name: userName, avatar_url: avatar, bio: bio)

	10.times do
		content = Faker::Lorem.sentence
		title = Faker::Simpsons.location
		pic_name = 1 + Random.rand(22)
		picture = seed_image(pic_name)

		Post.create(title: title, content: content, postType: 'photo', picture: picture, user_id: user.id)
	end
end


User.all.each do |user| 
	if user.id != User.last.id
		user.connected_users << User.find(user.id + 1)
	end
end
