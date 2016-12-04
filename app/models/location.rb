class Location < ApplicationRecord
  # Direct associations

  has_many   :packages,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
