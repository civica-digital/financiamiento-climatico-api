class Project < ActiveRecord::Base
  validates :area, :year, :name, :quantity, :currency, :financing, :region, :grant, :status, :source,
            :observations, presence: true
  has_and_belongs_to_many :organizations
end
