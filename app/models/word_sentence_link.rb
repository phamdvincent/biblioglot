# == Schema Information
#
# Table name: word_sentence_links
#
#  id                   :integer          not null, primary key
#  index_in_sentence    :integer
#  word_audio_timestamp :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  book_id              :integer
#  language_id          :integer
#  sentence_id          :integer
#  word_id              :integer
#
class WordSentenceLink < ApplicationRecord
  belongs_to :sentence
  belongs_to :language
  belongs_to :word

  def populate_word_sentence_link(book, sentence_object, word, word_index_in_sentence, word_audio_timestamps)
    self.index_in_sentence = word_index_in_sentence
    self.word_audio_timestamp = word_audio_timestamps[word_index_in_sentence]["time"]
    self.book_id = book.id
    self.language_id = book.language_id
    self.sentence_id = sentence_object.id
    self.word_id = word.id
  end

end
