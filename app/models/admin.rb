class Admin < ApplicationRecord
  has_secure_password
  validate :name, {presence: true}
  validate :mail, {presence: true, uniqueness: true}
  
end
