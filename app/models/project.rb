class Project < ActiveRecord::Base
  validates :area, :year, :name, :quantity, :currency, :financing, :region, :grant, :status, :source,
            :observations, presence: true
end
