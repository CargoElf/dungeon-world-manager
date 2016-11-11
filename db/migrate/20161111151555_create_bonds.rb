class CreateBonds < ActiveRecord::Migration[5.0]
  def change
    create_table :bonds do |t|
      t.string :description

      t.timestamps
    end
  end
end
