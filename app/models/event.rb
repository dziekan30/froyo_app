class Event < ApplicationRecord
  belongs_to :user

  # validates :user_id, presence: true
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
