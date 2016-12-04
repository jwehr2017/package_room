class Apartment < ApplicationRecord
  # Direct associations

  has_many   :residents,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
