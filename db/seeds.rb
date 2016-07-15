admin = User.create!(email: "admin@admin.com", password: "secret123", password_confirmation: "secret123", system_admin: true)
puts "System admin created with email: #{admin.email}"

organization_user = Organization.create!(name: "Organización 1", email: "org@mail.com", password: "secret123", password_confirmation: "secret123")
puts "Organization created with email: #{organization_user.email}"

ally_user = Ally.create!(name: "Aliado 1", email: "aliado@mail.com", password: "secret123", password_confirmation: "secret123")
puts "Ally user created with email: #{ally_user.email}"
