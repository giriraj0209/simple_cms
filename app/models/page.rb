class Page < ActiveRecord::Base
	belongs_to :category
	belongs_to :type

	has_many :fields
	accepts_nested_Attributes_for :fields, reject_if: :all_blank
end
