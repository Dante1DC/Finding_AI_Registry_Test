class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.string :first_image_url
      t.string :second_image_url
      t.string :image_preferred
      t.string :image_identified_as_ai
      t.boolean :correctly_identified

      t.timestamps
    end
  end
end
