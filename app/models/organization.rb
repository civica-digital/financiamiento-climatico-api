class Organization < User
  validates :name, presence: true
end
