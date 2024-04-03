# == Schema Information
#
# Table name: word_sentence_links
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :integer
#  language_id :integer
#  sentence_id :integer
#  word_id     :integer
#
class WordSentenceLink < ApplicationRecord
  belongs_to :sentences
  belongs_to :languages
  belongs_to :words
end
