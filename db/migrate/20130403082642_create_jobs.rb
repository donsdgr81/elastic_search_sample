class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.float  :salary
      t.string :company
      t.string :skill
      t.text   :description
      t.date   :published_date

      t.timestamps
    end
  end
end
