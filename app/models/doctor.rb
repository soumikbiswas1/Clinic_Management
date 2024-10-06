class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients_to_attend, -> { to_attend }, class_name: 'Patient', foreign_key: 'doctor_id'
  has_many :attended_patients, -> { attended }, class_name: 'Patient', foreign_key: 'doctor_id'
end
