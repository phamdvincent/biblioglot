require 'json'
require 'pycall/import'


def get_translation(source_lang, content)
  PyCall.sys.path.append('.')
  PyCall.import_module('translation')
  python_module = PyCall.import_module('translation')
  api_key = ENV["DEEPL_KEY"]
  json_response = python_module.get_translation(api_key, source_lang, content)

  # puts json_response
  # puts json_response.class
end

# get_translation("ES", "SERÍAN las diez de la mañana de un día de octubre.")
