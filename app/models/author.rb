# == Schema Information
#
# Table name: authors
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  crypted_password :string(255)      not null
#  salt             :string(255)      not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
