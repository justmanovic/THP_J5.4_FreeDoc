class Doctor < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments
    belongs_to :city
    belongs_to :specialty
end
