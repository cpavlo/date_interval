class CreateDatedResources < ActiveRecord::Migration
  def change
    create_table :dated_resources do |t|
      t.datetime :date
      t.string :name

      t.timestamps null: false
    end
  end
end
