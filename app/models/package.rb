class Package < ApplicationRecord
  # Direct associations

  belongs_to :employee

  belongs_to :location,
             :counter_cache => true

  belongs_to :resident,
             :counter_cache => true

  # Indirect associations

  # Validations

end
