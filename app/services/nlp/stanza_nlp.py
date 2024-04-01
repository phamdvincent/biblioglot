import stanza
import json

# stanza.download('es')

def get_json_data(content, language):
  story = []
  process_options = "tokenize,mwt,pos,lemma,ner"
  stanza.download(lang=language, processors=process_options)
  nlp = stanza.Pipeline(lang=language, processors=process_options, download_method=None)
  doc = nlp(content)
  for sentence in doc.sentences:
    story.append({ "sentence": sentence.text, "tokens": sentence.to_dict() })

  return story
