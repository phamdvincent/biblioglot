# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  author           :string
#  publication_year :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  language_id      :integer
#
class Book < ApplicationRecord
  belongs_to :languages
  has_many :progresses
  has_many :users, through: :progresses
  has_many :sentences
  has_many :word_sentence_links
end
