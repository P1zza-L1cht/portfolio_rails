class Admin < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}
  validates :mail, {presence: true, uniqueness: true}
  
end
