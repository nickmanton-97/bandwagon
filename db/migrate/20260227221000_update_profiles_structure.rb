class UpdateProfilesStructure < ActiveRecord::Migration[8.1]
  def change
    remove_column :profiles, :name, :string
    remove_column :profiles, :genres, :string
    remove_column :profiles, :instruments, :string
    remove_column :profiles, :pro_badge, :boolean

    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :profile_colour, :integer, default: 0, null: false
    add_column :profiles, :commitment_level, :integer, default: 0, null: false

    add_column :profiles, :instruments, :string, array: true, default: []
    add_column :profiles, :influences, :string, array: true, default: []
  end
end
