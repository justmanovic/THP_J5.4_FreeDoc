class Specialty < ApplicationRecord
  has_many :specialty_doctors, dependent: :destroy  
  has_many :doctors, through: :specialty_doctors
end
