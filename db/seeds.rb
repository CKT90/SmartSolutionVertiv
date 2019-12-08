
User.create!(name: "User1", 
			 email: "test@gmail.com", 
			 password: "112233", 
			 password_confirmation: "112233",
			 company: "test",
			 superuser: true,
			 admin: true,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "test1", 
			 email: "test1@gmail.com", 
			 password: "112233", 
			 password_confirmation: "112233", 
			 admin: false,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "test2", 
			 email: "test2@gmail.com", 
			 password: "112233", 
			 password_confirmation: "112233", 
			 admin: false,
			 activated: true,
			 activated_at: Time.zone.now)

User.create!(name: "test3", 
			 email: "test3@gmail.com", 
			 password: "112233", 
			 password_confirmation: "112233", 
			 admin: false,
			 status: "Gold NSP",
			 activated: true,
			 activated_at: Time.zone.now)


