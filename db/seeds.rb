10.times do
	login = Faker::Twitter.screen_name
	userName = Faker::Name.name
	avatar = Faker::Avatar.image
	bio = Faker::HitchhikersGuideToTheGalaxy.marvin_quote

	user = User.create(login: login, name: userName, avatar_url: avatar, bio: bio)

	10.times do
		content = Faker::Lorem.sentence
		title = Faker::Simpsons.location

		Post.create(title: title, content: content, postType: 'photo', user_id: user.id)
	end
end


User.all.each do |user| 
	if user.id != User.last.id
		user.connected_users << User.find(user.id + 1)
	end
end