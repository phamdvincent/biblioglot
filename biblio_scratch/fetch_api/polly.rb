require_relative "../../app/services/audio/audio_service"
include Audio

require "json"


def get_audio_timestamps
  @polly = Aws::Polly::Client.new(region: "us-east-1")
  resp = @polly.synthesize_speech({
    engine: "neural",
    language_code: "es-ES",
    output_format: "json",
    text: "El hombre es gordo.",
    voice_id: "Sergio",
    speech_mark_types: ["word"]
  })

  audio_word_timestamps = []

  resp.audio_stream.each do |item|
    audio_word_timestamps.append(JSON.parse(item))
  end

  puts audio_word_timestamps
  puts audio_word_timestamps[0]["time"]
end

get_audio_timestamps
