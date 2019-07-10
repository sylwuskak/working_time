class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :working_time_records
  has_many :categories

  after_create :add_default_categories

  def add_default_categories
    Category.create!(
      user: self,
      category_name: "No category"
    )
  end


end
