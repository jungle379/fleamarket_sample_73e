class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :first_name,                  null: false
      t.string :family_name,                 null: false
      t.string :first_name_kana,             null: false
      t.string :family_name_kana,            null: false
      t.string :post_code,                   null: false
      t.string :city,                        null: false
      t.string :house_number,                null: false
      t.string :building_name
      t.string :telephone_number

      #マイグレーションのver5.2ではreference型を取るとエラーが出るため、integerにて登録し、外部キーを設定する
      t.integer :user_id,                    null: false, foreign_key: true
      t.integer :prefecture_id,              null: false, foreign_key: true

      t.timestamps

    end

      add_index :addresses, :telephone_number, unique: true

  end
end
