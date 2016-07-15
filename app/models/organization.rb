class Organization < User
  validates :name, presence: true
  has_and_belongs_to_many :projects
  belongs_to :owner, class_name: User, foreign_key: :owner_id
end
