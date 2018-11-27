
User.create!(name:  "Admin",
             email: "admin@admin.org",
             password:              "adminadmin",
             password_confirmation: "adminadmin",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "User",
             email: "user@user.org",
             password:              "useruser",
             password_confirmation: "useruser",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)