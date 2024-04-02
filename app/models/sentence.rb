# == Schema Information
#
# Table name: sentences
#
#  id                  :integer          not null, primary key
#  audio               :string
#  content             :string
#  english_translation :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  book_id             :integer
#  language_id         :integer
#
class Sentence < ApplicationRecord
end
