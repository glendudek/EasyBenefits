class CreateBenefitProviderTable < ActiveRecord::Migration
  def change
    create_table :benefit_providers do |t|
      t.string :name

      t.timestamps
    end
  end
end
