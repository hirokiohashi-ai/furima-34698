require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  validates :email, uniqueness: true
  validates :encrypted_password, length: { minimum: 6 }
end
