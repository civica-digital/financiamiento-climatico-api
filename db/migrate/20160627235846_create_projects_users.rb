class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :project, index: true
    end
  end
end
