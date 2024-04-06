# == Schema Information
#
# Table name: definitions
#
#  id          :integer          not null, primary key
#  definition  :string
#  dict_pos    :string
#  nlp_upos    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#  word_id     :integer
#
class Definition < ApplicationRecord
end
