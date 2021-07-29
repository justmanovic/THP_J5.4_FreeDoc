class SpltyTableLinksUpdate < ActiveRecord::Migration[5.2]
  def change
    add_reference :specialty_doctors, :doctor, foreign_key: true
    add_reference :specialty_doctors, :specialty, foreign_key: true
  end
end
