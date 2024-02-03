class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :test_results, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :nickname, presence: true
  validates :email, uniqueness: true, presence: true
  validates :grade_and_class, presence: true
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def own?(object)
    id == object.user_id
  end

  def average_achievement_rate
    test_results.average(:achievement_rate)
  end

  def self.ransackable_associations(auth_object = nil)
    ["test_results"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "crypted_password", "email", "first_name", "grade_and_class", "id", "id_value", "introduction", "last_name", "nickname", "salt", "updated_at"]
  end
end
