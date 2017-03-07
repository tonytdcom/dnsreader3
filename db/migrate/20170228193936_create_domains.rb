class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :domain
      t.string :spf
      t.string :dmarc
      t.string :txt
      t.string :sip

      t.timestamps null: false
    end
  end
end
