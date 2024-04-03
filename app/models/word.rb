# == Schema Information
#
# Table name: words
#
#  id             :integer          not null, primary key
#  audio          :string
#  definition     :string
#  part_of_speech :string
#  word           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  language_id    :integer
#
class Word < ApplicationRecord
  has_many :word_sentence_links
  belongs_to :languages
end
