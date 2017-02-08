class AddIndexesAndUniqueness < ActiveRecord::Migration
  def change
    add_column :shortened_urls, :user_id, :integer, null: false
    add_index :shortened_urls, :short_url, unique: true
    add_index :shortened_urls, :user_id
  end
end
