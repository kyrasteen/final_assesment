# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

