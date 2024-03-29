class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,              null: false, default: ""
      t.text   :catch_copy         
      t.text   :concept            
      t.text   :image
      t.references :user
      t.timestamps
    end
  end
end
