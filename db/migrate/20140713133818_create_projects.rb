class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :Name
      t.string :Code
      t.text :Description
      t.string :BillingType
      t.date :StartDate
      t.date :DeadlineDate
      t.date :EndDate
      t.string :gitHubUrl
      t.string :status

      t.timestamps
    end
  end
end
