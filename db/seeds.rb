User.create!(
  name: "Test User",
  email: "test@example.com"
) unless User.exists?
