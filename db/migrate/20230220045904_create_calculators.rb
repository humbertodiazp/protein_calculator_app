class CreateCalculators < ActiveRecord::Migration[7.0]
  def change
    create_table :calculators do |t|
      t.string :body_weight
      t.string :goal_weight
      t.string :protein

      t.timestamps
    end
  end
end
