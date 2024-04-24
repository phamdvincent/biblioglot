# == Schema Information
#
# Table name: definitions
#
#  id          :integer          not null, primary key
#  content     :string
#  dict_pos    :string
#  nlp_upos    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#  word_id     :integer
#

class Definition < ApplicationRecord
  belongs_to :word
  belongs_to :language

  def populate_definition(language, word, token, book, definition)
    self.content = get_definition_text(definition)
    self.dict_pos = get_dict_pos(definition)
    self.nlp_upos = token["upos"]
    self.language_id = book.language_id
    self.word_id = word.id

  end

  private

  def get_dict_pos(dictionary_definition)
    dict_pos = dictionary_definition["pos"]
    return dict_pos
  end

  def get_definition_text(dictionary_definition)
    if dictionary_definition["senses"].at(0).key?("glosses")
      definition_text = dictionary_definition["senses"].at(0)["glosses"]
    else
      definition_text = "Definition not found"
    end
    return definition_text
  end
end
