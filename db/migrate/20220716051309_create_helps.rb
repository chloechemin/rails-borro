class CreateHelps < ActiveRecord::Migration[6.1]
  def change
    create_table :helps do |t|
      t.text :message
      t.references :user, null: false, foreign_key: true
      t.references :help_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
