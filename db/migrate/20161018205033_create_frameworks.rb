class CreateFrameworks < ActiveRecord::Migration[5.0]
  def change
    create_table :frameworks do |t|
      t.string :name
      t.json :properties

      t.timestamps
    end
  end
end
