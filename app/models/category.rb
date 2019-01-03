class Category < ApplicationRecord
    belongs_to :user
    has_many :working_time_records
end
