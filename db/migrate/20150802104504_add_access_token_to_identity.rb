class AddAccessTokenToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :access_token, :string
  end
end
