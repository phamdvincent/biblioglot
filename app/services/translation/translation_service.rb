require 'json'

require 'deepl'

module Translation
  class TranslationService
    def self.get_translation(source_lang, content)
      DeepL.configure do |config|
        config.auth_key = ENV["DEEPL_KEY"]
      end

      translation = DeepL.translate content, source_lang.upcase, "EN-US"

      return translation
    end
  end
end
