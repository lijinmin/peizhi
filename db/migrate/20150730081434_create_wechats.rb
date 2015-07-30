class CreateWechats < ActiveRecord::Migration
  def change
    create_table :wechats do |t|

      t.timestamps null: false
    end
  end
end
