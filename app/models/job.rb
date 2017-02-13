class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.count_by_city
    group(:city).count
  end

  def self.jobs_by_interest
    limit(10).order(level_of_interest: :desc)
  end
end
