class User < ActiveRecord::Base

  has_many :user_languages
  has_many :languages, through: :user_languages

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.username  = data.info.nickname
    user.email     = data.info.email
    user.image_url = data.info.image
    user.token     = data.credentials.token
    user.save

    user
  end

  def add_preferred_languages(chosen_languages)
    chosen_languages.each do |language|
      preferred_language = Language.create(title: language)
      languages << preferred_language
    end
  end
end

