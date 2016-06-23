admin = User.create!(email: "admin@admin.com", password: "secret123", password_confirmation: "secret123", system_admin: true)
puts "System admin created with email: #{admin.email}"