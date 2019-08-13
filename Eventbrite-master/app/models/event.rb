class Event < ApplicationRecord
#  after_create :new_participation

#  def new_participation
#    EventMailer.new_participation(self).deliver_now
#  end

  validates :start_date,
    presence: true
    validate :in_the_past?
  validates :duration,
    presence: true,
    numericality: { greater_than_or_equal_to: 5 }
    validate :multiple_of_5?
  validates :title,
    presence: true,
    length: { in: 5..140 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    length: { in: 1..1000 }
  validates :location,
    presence: true

  has_many :participations
  has_many :users, through: :participations
  belongs_to :user

  private

  def multiple_of_5?
    return duration unless duration % 5 != 0 || duration.negative?
    errors.add(
      :duration,
      'The duration must end by 0 ou 5 and be a positive number.'
    )
  end

  def in_the_past?
    return start_date unless start_date < Time.now
    errors.add(:start_date, 'The start date cannot be in the past!')
  end
end
