class AddCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.references :user, null: false
    end

    add_reference :working_time_records, :category, foreign_key: true

    User.all.each do |user|
      c = Category.create!(
        user: user,
        category_name: "No category"
      )

      user.working_time_records.each do |record|
        record.update!(category: c)
      end

    end

  end
end
