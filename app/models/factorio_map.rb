class FactorioMap < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :zip
  do_not_validate_attachment_file_type :zip
end
