class AddUserIdToGyms < ActiveRecord::Migration[7.1]
  def change
    add_reference :gyms, :user, foreign_key: true
  end
end
