require 'json'
require 'pycall/import'

class NLP_Processor
  def get_nlp_json(content, language)
    # PyCall.sys.path.append('./app/services/nlp')
    PyCall.sys.path.append('.')
    PyCall.import_module('stanza_nlp')
    python_module = PyCall.import_module('stanza_nlp')
    json_response = python_module.get_json_data(content, language)
    puts json_response
    puts json_response.class
    return json_response
    # puts json_response
    # puts json_response.class
  end
end

NLP_Processor.new.get_nlp_json("El hombre es gordo. La mujer es bonita.",'es')

# NLP_Processor.new.get_nlp_json("SERÍAN las diez de la mañana de un día de octubre. En el patio de la Escuela de Arquitectura, grupos de estudiantes esperaban a que se abriera la clase.")
