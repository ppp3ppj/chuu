# frozen_string_literal: true

admin = User.find_by(email: 'admin@project.com')
user = User.find_by(email: 'user@project.com')

# example role
[:admin, :author, :contact, :user].each do |role|
  Role.where({ name: role }, without_protection: true).first_or_create
end

if admin.blank?
  # admin = User.create(email: 'admin@project.com', password: 'password', password_confirmation: 'password', first_name: 'admin', title: 'Mr', confirmed_at: Time.now.utc)
  admin = User.create(email: 'admin@project.com', password: 'password', password_confirmation: 'password', confirmed_at: Time.now.utc)
  admin.skip_confirmation!
  admin.skip_confirmation_notification!
  admin.add_role :admin
end

if user.blank?
  # user = User.new(email: 'user@project.com', password: 'password', password_confirmation: 'password', first_name: 'user', title: 'Mr', confirmed_at: Time.now.utc)
  user = User.new(email: 'user@project.com', password: 'password', password_confirmation: 'password', confirmed_at: Time.now.utc)
  user.skip_confirmation!
  user.skip_confirmation_notification!
  user.add_role :user
  user.save
end


