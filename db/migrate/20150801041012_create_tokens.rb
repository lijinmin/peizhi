class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :appid
      t.string :appsecret
      t.string :access_token
      t.datetime :update_time

      t.timestamps null: false
    end
  end
end
