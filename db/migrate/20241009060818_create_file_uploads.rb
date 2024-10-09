class CreateFileUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :file_uploads do |t|
      t.references :user, null: false, foreign_key: true   # Links file to the user who uploaded it
      t.string :title, null: false                         # Title of the file
      t.text :description                                  # Description of the file
      t.string :file_type                                  # The MIME type of the file
      t.string :tiny_url, unique: true                     # Unique tiny URL for sharing the file
      t.datetime :expires_at                               # (Optional) Expiration date for sharing links, if required

      t.timestamps
    end

    # Ensure that tiny_url is unique for public file sharing
    add_index :file_uploads, :tiny_url, unique: true
  end
end
