class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def buffer_mod
    if self.buffer == true
      self.start_time -= 30.minutes
      self.end_time += 30.minutes
    end
  end

  def unique_date_time_check
    events = Event.all
    events.each do |event|
      if self.start_time >= event.start_time && self.end_time <= event.end_time || self.end_time >= event.start_time && self.end_time <= event.end_time
        self.start_time = nil
        self.start_time = nil
      end
    end
  end

end
