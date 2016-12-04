class Resident < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :packages,
             :dependent => :nullify

  belongs_to :apartment,
             :counter_cache => true

  # Indirect associations

  # Validations

end
