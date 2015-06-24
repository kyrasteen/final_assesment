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

User.create(username: "betty", about: "I cannot get enough of CSS", image_url: "somepic.jpg")
User.create(username: "joe", about: "I cannot get enough of Node.js", image_url: "somepic.jpg")
User.create(username: "chris", about: "I cannot get enough of R", image_url: "somepic.jpg")
User.create(username: "shirley", about: "what is programming?", image_url: "somepic.jpg")
