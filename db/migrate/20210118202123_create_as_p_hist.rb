class CreateAsPHist < ActiveRecord::Migration[6.1]
  def change
    create_table :as_p_hist do |t|

      t.timestamps
    end
  end
end
