pwd = SecureRandom.base58
User.create(
  :username => "inactive-user",
  :email => "inactive-user@example.com",
  :password => pwd,
  :password_confirmation => pwd
)

User.create(
  :username => "pipecraft_net",
  :email => "pipecraft.net@gmail.com",
  :password => "test",
  :password_confirmation => "test",
  :is_admin => true,
  :is_moderator => true,
  :karma => [
    User::MIN_KARMA_TO_SUGGEST,
    User::MIN_KARMA_TO_FLAG,
    User::MIN_KARMA_TO_SUBMIT_STORIES,
    User::MIN_KARMA_FOR_INVITATION_REQUESTS
  ].max,
  :created_at => 106.days.ago
  # :created_at => User::NEW_USER_DAYS.days.ago
)

User.create(
  :username => "dto_rss_bot",
  :email => "dndyefol@duck.com",
  :password => "test",
  :password_confirmation => "test",
  :created_at => 106.days.ago
  # :created_at => User::NEW_USER_DAYS.days.ago
)

User.create(
  :username => "demo_user_1",
  :email => "demo_user_1@example.com",
  :password => "demo_user_1",
  :password_confirmation => "demo_user_1",
  :karma => -1000,
  :disabled_invite_at => Time.current
)

User.create(
  :username => "demo_user_2",
  :email => "demo_user_2@example.com",
  :password => "demo_user_2",
  :password_confirmation => "demo_user_2",
  :karma => -1000,
  :disabled_invite_at => Time.current
)

User.create(
  :username => "demo_user_3",
  :email => "demo_user_3@example.com",
  :password => "demo_user_3",
  :password_confirmation => "demo_user_3",
  :karma => -1000,
  :disabled_invite_at => Time.current
)

{
  dev: {
    app: "Mobile app development",
    web: "Web development and news",
    devops: "DevOps",
    api: "API development/implementation",
    debugging: "Debugging techniques",
    testing: "Software testing",
    security: "Netsec, appsec, and infosec",
    performance: "Performance and optimization",
    programming: "Use when every tag or no specific tag applies",
  },
  languages: {
    c: "",
    "c++": "",
    css: "",
    dotnet: "",
    go: "",
    java: "",
    javascript: "",
    lua: "",
    nodejs: "",
    objectivec: "",
    php: "",
    python: "",
    ruby: "",
    rust: "",
    scala: "",
    swift: "",
    flutter: "",
  },
  os: {
    android: "Android",
    ios: "Apple iOS",
    linux: "Linux",
    unix: "*nix",
    mac: "Apple macOS",
    windows: "Windows",
  },
  tools: {
    databases: "Databases (SQL, NoSQL)",
    emacs: "Emacs editor",
    vim: "Vim editor",
    browsers: "Web browsers",
  },
  field: {
    cryptography: "Cryptography",
    education: "Education",
    hardware: "Hardware",
    math: "Mathematics",
    science: 'It\'s "Science"',
    ai: "Artificial Intelligence, Machine Learning",
    culture: "Development communities and culture",
  },
  format: {
    ask: "Aks DTO",
    show: "发布你的创意作品",
    release: "Software releases and announcements",
    docs: "开发文档",
    tutorials: "教程，学习指南",
    audio: "Link to audio (podcast, interview)",
    book: "Link to a book (not an ad or review)",
    pdf: "Link to a PDF document",
    slides: "Slide deck",
    video: "Link to a video",
  },
  comments: {
    "hacker-news": "Hacker News - https://news.ycombinator.com/",
    lobsters: "Lobsters - https://lobste.rs/",
    reddit: "r/programming - https://www.reddit.com/r/programming/",
  },
  dto: {
    announce: "Site anouncement",
    meta: "Site related topics",
  },
  low: {
    wechat: "微信公众号文章或要求关注微信公众号",
    "many-ads": "广告多",
    "bad-ux": "用户体验差",
    "install-app": "要求安装应用",
    popups: "弹窗多",
  },
  misc: {
    job: "Employment/Internship opportunities",
  },
}.each do |category, tags|
  c = Category.create(category: category)
  tags.each do |tag, description|
    Tag.create(category: c, tag: tag, description: description)
  end
end


[
  "link.medium.com",
  "t.co",
  "pixelstech.cn",
  "shorturl.at",
  "git.io",
  "zip.net",
  "yourls.org",
  "yep.it",
  "x.co",
  "✩.ws",
  "➡.ws",
  "wp.me",
  "vzturl.com",
  "v.gd",
  "u.to",
  "u.bb",
  "twitthis.com",
  "tweez.md",
  "tr.im",
  "tny.im",
  "tinyurl.com",
  "tiny.cc",
  "tinyarrows.com",
  "t.co",
  "sptfy.com",
  "s.id",
  "scrnch.me",
  "research.eligrey.com",
  "qr.net",
  "qr.ae",
  "q.gs",
  "prettylinkpro.com",
  "po.st",
  "ph.dog",
  "ow.ly",
  "lnkd.in",
  "link.tl",
  "j.mp",
  "ity.im",
  "is.gd",
  "goo.gl",
  "filoops.info",
  "ey.io",
  "doiop.com",
  "db.tt",
  "cutt.us",
  "cur.lv",
  "buzurl.com",
  "bitly.com",
  "bit.ly",
  "bit.do",
  "bc.vc",
  "al.ly",
  "adf.ly",
  "7.ly",
  "1url.com"
].each do |domain|
  Domain.create(domain: domain, banned_by_user_id: 2, banned_reason: 'Used for link shortening and ad tracking', banned_at: Time.current)
end

puts "created:"
puts "  * an admin with username/password of test/test"
puts "  * inactive-user for disowned comments by deleted users"
puts "  * a test tag"
puts
puts "If this is a dev environment, you probably want to run `rails fake_data`"
puts "If this is production, you want to run `rails console` to rename your admin. Edit your category, and tag on-site."
