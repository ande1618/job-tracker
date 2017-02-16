class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.average_level_of_interest
    companies = Company.all
    @levels= {}
    companies.each do |company|
      @levels[company.name] = company.jobs.average(:level_of_interest)
    end
  end
end
