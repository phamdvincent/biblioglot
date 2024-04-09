require_relative "../app/services/nlp/nlp_service"
include Nlp

story = NlpService.get_nlp("es", "Al encontrarse.")

story.each do |item|
  do_not_do = []
  item["tokens"].each_with_index do |token, index|
    if !do_not_do.include?(token["id"])
      puts "#{index}: #{token["id"]}"

      if token["id"].kind_of?(Array)
        token["id"].each do |id|
          do_not_do.append(id)
        end
      end
    end
    # puts do_not_do
  end
end
