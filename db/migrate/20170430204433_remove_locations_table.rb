class RemoveLocationsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :locations, force: :cascade
  end
end
