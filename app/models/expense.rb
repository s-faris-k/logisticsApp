class Expense < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle
end
