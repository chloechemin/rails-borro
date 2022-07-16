class CreateHelpRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :help_requests do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :location
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
