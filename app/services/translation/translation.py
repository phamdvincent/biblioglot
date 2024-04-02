import deepl

def get_translation(api_key, source_lang, content):
  translator = deepl.Translator(api_key)
  result = translator.translate_text(content, source_lang=source_lang, target_lang="EN-US")
  return result.text
