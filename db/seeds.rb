# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
#     Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Beer.brand)
#     Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Cannabis.cannabinoid_abbreviation)
#     Appointment.create(date:Faker::Date.between(from: '2020-09-23', to: '2021-07-29'), doctor:Doctor.all[rand(0..Doctor.all.count)], patient:Patient.all[rand(0..Patient.all.count)])
# end

City.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
Specialty.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'specialties'")
Doctor.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctors'")
Patient.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patients'")
Appointment.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'appointments'")
SpecialtyDoctor.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'specialty_doctors'")

tab_specialties = ['allergologie','andrologie','anesthésiologie','cardiologie','chirurgie plastique','charlatan']
cities = [["St Germain le chatelet","90110"], ["Sermamagny","90300"], ["Villars le sec","90100"], ["Angerville","91670"], ["Arrancourt", "91690"], ["Boullay Les Troux", "91470"], ["Bouville", "91880"], ["Brieres les scelles", "91150"], ["Buno Bonnevaux", "91720"]]

9.times do |i|
  City.create(city_name:cities[i][0])
end

6.times do |i|
  Specialty.create(specialty_name:tab_specialties[i])
end

10.times do
  Doctor.create(first_name:Faker::Name.first_name, last_name:Faker::GreekPhilosophers.name.split[-1], city_id:rand(1..City.count))
end

10.times do
  Patient.create(first_name:Faker::Name.first_name, last_name:Faker::Team.creature.capitalize, city_id:rand(1..City.count))
end

10.times do
  Appointment.create(date:Faker::Time.between(from: "2014-09-19", to: DateTime.now), doctor_id:rand(1..10), patient_id:rand(1..10), city_id:rand(1..City.count))
end

10.times do |i|
  rand(1..4).times do
    SpecialtyDoctor.create(doctor_id: i, specialty_id:rand(1..6))
  end
end