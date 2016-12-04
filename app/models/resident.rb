class Resident < ApplicationRecord
  # Direct associations

  belongs_to :apartment,
             :counter_cache => true

  # Indirect associations

  # Validations

end
