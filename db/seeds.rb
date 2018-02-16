10.times do
	login = Faker::Twitter.screen_name
	userName = Faker::Name.name
	avatar = Faker::Avatar.image
	bio = Faker::HitchhikersGuideToTheGalaxy.marvin_quote

	User.create(login: login, name: userName, avatar_url: avatar, bio: bio)
end
