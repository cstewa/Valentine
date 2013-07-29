class AddIsProfileToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_profile, :boolean, :default => false
  end
end
