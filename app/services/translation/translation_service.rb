require 'json'
# require 'pycall/import'

require 'deepl'

module Translation
  class TranslationService
    def self.get_translation(source_lang, content)
      # PyCall.sys.path.append("./app/services/translation")
      # # PyCall.sys.path.append('.')
      # PyCall.import_module("translation")
      # python_module = PyCall.import_module("translation")
      # api_key = ENV["DEEPL_KEY"]
      # response = python_module.get_translation(api_key, source_lang, content)
      DeepL.configure do |config|
        config.auth_key = ENV["DEEPL_KEY"]
      end

      translation = DeepL.translate content, source_lang.upcase, "EN-US"

      return translation
    end
  end
end

# module TranslationService
#   def self.get_translation(source_lang, content)
#     PyCall.sys.path.append('./app/services/translation')
#     # PyCall.sys.path.append('.')
#     PyCall.import_module('translation')
#     python_module = PyCall.import_module('translation')
#     api_key = ENV["DEEPL_KEY"]
#     response = python_module.get_translation(api_key, source_lang, content)
#     return response

#   end
# end

# # get_translation("ES", "SERÍAN las diez de la mañana de un día de octubre.")
