languages = ["JavaScript",
  "Java",
  "Ruby",
  "C",
  "CSS",
  "PHP",
  "Python",
  "C++",
  "Objective-C",
  "C#",
  "Shell",
  "R",
  "CoffeeScript",
  "Go",
  "Perl",
  "Scala",
  "VimL",
  "Clojure",
  "Haskell",
  "Erlang",
  "Rust",
  "Swift"]

languages.each do |language|
  Language.create(title: language)
end

User.create(username: "betty", about: "I cannot get enough of CSS", image_url: "http://placekitten.com/g/200/300")
User.create(username: "joe", about: "I cannot get enough of Node.js", image_url: "http://placekitten.com/g/200/300")
User.create(username: "chris", about: "I cannot get enough of R", image_url: "http://placekitten.com/g/200/300")
User.create(username: "lucy", about: "I need help!", image_url: "http://placekitten.com/g/200/300")
User.create(username: "rick", about: "I have this idea", image_url: "http://placekitten.com/g/200/300")
User.create(username: "paul", about: "Can you fix this?", image_url: "http://placekitten.com/g/200/300")
User.create(username: "tino", about: "I love genetic algorithms", image_url: "http://placekitten.com/g/200/300")
User.create(username: "mirjoy", about: "can we knit?", image_url: "http://placekitten.com/g/200/300")
User.create(username: "markus", about: "i did that three times already", image_url: "http://placekitten.com/g/200/300")
User.create(username: "trey", about: "check the bashrc", image_url: "http://placekitten.com/g/200/300")
User.create(username: "jgu", about: "you use vim right?", image_url: "http://placekitten.com/g/200/300")
User.create(username: "dustin", about: "traveling programmer", image_url: "http://placekitten.com/g/200/300")
User.create(username: "mack", about: "would love to pair", image_url: "http://placekitten.com/g/200/300")
User.create(username: "lori", about: "woohoo!", image_url: "http://placekitten.com/g/200/300")
User.create(username: "kit", about: "working hard", image_url: "http://placekitten.com/g/200/300")
User.create(username: "loma", about: "I love teamwork", image_url: "http://placekitten.com/g/200/300")
User.create(username: "john", about: "we can figure anything out", image_url: "http://placekitten.com/g/200/300")

2.times do
  User.all.each do |user|
    language = Language.find_by(title: languages.sample)
    ul = UserLanguage.create(user_id:user.id, language_id: language.id)
    user.user_languages << ul
  end
end
