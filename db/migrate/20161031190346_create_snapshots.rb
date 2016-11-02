class CreateSnapshots < ActiveRecord::Migration[5.0]
  def change
    create_table :snapshots do |t|
      t.references :framework, index: true
      t.json :properties
      t.timestamps
    end

    add_foreign_key :snapshots, :frameworks
  end
end
