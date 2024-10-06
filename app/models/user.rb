# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
    enum role: { receptionist: 0, Doctor: 1, admin: 2 }

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
  end

# app/models/user.rb
