require 'json'
require 'pycall/import'

module Translation_Service
  def self.get_translation(source_lang, content)
    PyCall.sys.path.append('./app/services/translation')
    # PyCall.sys.path.append('.')
    PyCall.import_module('translation')
    python_module = PyCall.import_module('translation')
    api_key = ENV["DEEPL_KEY"]
    response = python_module.get_translation(api_key, source_lang, content)
    return response

  end
end

# get_translation("ES", "SERÍAN las diez de la mañana de un día de octubre.")
