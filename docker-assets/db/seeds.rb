pwd = SecureRandom.base58
User.create(
  :username => "inactive-user",
  :email => "inactive-user@example.com",
  :password => pwd,
  :password_confirmation => pwd
)

User.create(
  :username => "demouser_01",
  :email => "demouser_01@example.com",
  :password => "demouser_01",
  :password_confirmation => "demouser_01",
  :karma => -1000,
  :disabled_invite_at => Time.current
)

User.create(
  :username => "demouser_02",
  :email => "demouser_02@example.com",
  :password => "demouser_02",
  :password_confirmation => "demouser_02",
  :karma => -1000,
  :disabled_invite_at => Time.current
)

User.create(
  :username => "demouser_03",
  :email => "demouser_03@example.com",
  :password => "demouser_03",
  :password_confirmation => "demouser_03",
  :karma => -1000,
  :disabled_invite_at => Time.current
)

User.create(
  :username => "pipecraft_net",
  :email => "pipecraft_net@example.com",
  :password => "pipecraft_net",
  :password_confirmation => "pipecraft_net",
  :is_admin => true,
  :is_moderator => true,
  :karma => [
    User::MIN_KARMA_TO_SUGGEST,
    User::MIN_KARMA_TO_FLAG,
    User::MIN_KARMA_TO_SUBMIT_STORIES,
    User::MIN_KARMA_FOR_INVITATION_REQUESTS
  ].max,
  :created_at => User::NEW_USER_DAYS.days.ago
)

c = Category.create!(category: "Category")
Tag.create(category: c, tag: "java")

puts "created:"
puts "  * an admin with username/password of pipecraft_net/pipecraft_net"
puts "  * inactive-user for disowned comments by deleted users"
puts "  * a pipecraft_net tag"
puts
puts "If this is a dev environment, you probably want to run `rails fake_data`"
puts "If this is production, you want to run `rails console` to rename your admin. Edit your category, and tag on-site."
