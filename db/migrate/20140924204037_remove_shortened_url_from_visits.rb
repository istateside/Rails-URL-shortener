class RemoveShortenedUrlFromVisits < ActiveRecord::Migration
  def change
    remove_column :visits, :shortened_url
    add_column :visits, :url_id, :integer
  end
end
