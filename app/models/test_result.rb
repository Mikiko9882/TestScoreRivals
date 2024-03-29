class TestResult < ApplicationRecord
  belongs_to :user

  validates :test_name, presence: true
  validates :score, presence: true, numericality: { less_than_or_equal_to: :max_score } 
  validates :max_score, presence: true, numericality: { greater_than_or_equal_to: 0 } 
  validates :test_date, presence: true
  validates :preparation_time_minutes, presence: true

  before_save :calculate_achievement_rate

  def display_preparation_time
    hours = preparation_time_minutes / 60
    minutes = preparation_time_minutes % 60
    "#{hours}時間#{minutes}分"
  end

  private

  def calculate_achievement_rate
    return if score.nil? || max_score.nil?
    self.achievement_rate = ((score.to_f / max_score) * 100).round
  end

  def self.user_test_results(user)
    where(user: user).pluck(:test_name, :achievement_rate)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["achievement_rate", "created_at", "id", "id_value", "max_score", "score", "test_name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
