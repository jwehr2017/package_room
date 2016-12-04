class Package < ApplicationRecord
  # Direct associations

  belongs_to :resident,
             :counter_cache => true

  # Indirect associations

  # Validations

end
