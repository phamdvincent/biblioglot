require 'deepl'


DeepL.configure do |config|
  config.auth_key = ENV["DEEPL_KEY"]
end

translation = DeepL.translate "El hombre es gordo. La mujer es bonita.", "ES", "EN-US"

puts translation
