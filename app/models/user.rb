class User < ActiveRecord::Base

  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :potential_pairs, class_name: :PotentialPair, foreign_key: "requester_id"
  has_many :matches, class_name: :Match, foreign_key: "first_accepter_id"

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.username  = data.info.nickname
    user.email     = data.info.email
    user.image_url = data.info.image
    user.token     = data.credentials.token
    user.save

    update_all_potential_pairs(user)
    user
  end

  def self.update_all_potential_pairs(user)
    users = User.where.not(id: user.id)
    users.map do |other_user|
      user.potential_pairs.find_or_create_by(requested_id: other_user.id)
    end
  end

  def add_preferred_languages(chosen_languages)
    chosen_languages.each do |language|
      lang_id = Language.find_by(title: language)
      user_languages.create!(language_id: lang_id.id)
    end
  end
end

