# == Schema Information
#
# Table name: progresses
#
#  id                  :integer          not null, primary key
#  location            :integer
#  progress_percentage :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  book_id             :integer
#  user_id             :integer
#
class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
