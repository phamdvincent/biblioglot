require 'json'
require 'pycall/import'


def get_nlp_json(content)
  PyCall.sys.path.append('.')
  PyCall.import_module('stanza_nlp')
  python_module = PyCall.import_module('stanza_nlp')
  json_response = python_module.get_json_data(content)

  # puts json_response
  # puts json_response.class
end

# get_nlp_json("SERÍAN las diez de la mañana de un día de octubre. En el patio de la Escuela de Arquitectura, grupos de estudiantes esperaban a que se abriera la clase.")
