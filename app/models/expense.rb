class Expense < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :vehicle, optional: true
end
