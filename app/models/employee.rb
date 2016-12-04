class Employee < ApplicationRecord
  # Direct associations

  has_many   :packages,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
