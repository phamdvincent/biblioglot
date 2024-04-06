# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  audio       :string
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#
class Word < ApplicationRecord
  has_many :word_sentence_links
  has_many :definitions
  belongs_to :language

  validates :content, uniqueness:true
end
