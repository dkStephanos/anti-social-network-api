10.times do
	login = Faker::Twitter.screen_name
	userName = Faker::Name.name
	avatar = Faker::Avatar.image
	bio = Faker::HitchhikersGuideToTheGalaxy.marvin_quote

	user = User.create(login: login, name: userName, avatar_url: avatar, bio: bio)

	5.times do
		content = Faker::Lorem.sentence

		Post.create(content: content, postType: 'text', user_id: user.id)
	end
end
