# == Schema Information
#
# Table name: sentences
#
#  id                  :integer          not null, primary key
#  audio               :string
#  content             :string
#  english_translation :string
#  index_in_book       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  book_id             :integer
#  language_id         :integer
#
class Sentence < ApplicationRecord
  belongs_to :book
  has_many :word_sentence_links
  has_many :words, through: :word_sentence_links
end
