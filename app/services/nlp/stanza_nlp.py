import stanza
import json

# stanza.download('es')

def get_json_data(content):
  nlp = stanza.Pipeline('es')

  doc = nlp(content)

  return doc.to_dict()
