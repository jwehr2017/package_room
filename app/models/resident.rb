class Resident < ApplicationRecord
  # Direct associations

  has_many   :packages,
             :dependent => :nullify

  belongs_to :apartment,
             :counter_cache => true

  # Indirect associations

  # Validations

end
