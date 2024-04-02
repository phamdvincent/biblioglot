require 'aws-sdk-polly'  # In v2: require 'aws-sdk'

module Audio
  class AudioService
    def initialize(engine, language_code, content, voice_id)
      @polly = Aws::Polly::Client.new(region: "us-east-1")
      @engine = engine
      @language_code = language_code
      @content = content
      @voice_id = voice_id
    end

    def get_audio
      resp = @polly.synthesize_speech({
        engine: @engine,
        language_code: @language_code,
        output_format: "mp3",
        text: @content,
        voice_id: @voice_id,
      })

      audio_stream = resp.audio_stream.read
      return audio_stream
    end

    def self.generate_audio(language, content)
      if language == "es"
        engine = "neural"
        language_code = "es-ES"
        voice_id = "Sergio"
      end

      audio = AudioService.new(engine, language_code, content, voice_id)
      audio_data = audio.get_audio
      return audio_data
    end
  end
end

# module AudioService

#   class Audio_Voice
#     def initialize(engine, language_code, content, voice_id)
#       @polly = Aws::Polly::Client.new(region: 'us-east-1')
#       @engine = engine
#       @language_code = language_code
#       @content = content
#       @voice_id = voice_id
#     end

#     def get_audio
#       resp = @polly.synthesize_speech({
#         engine: @engine,
#         language_code: @language_code,
#         output_format: "mp3",
#         text: @content,
#         voice_id: @voice_id,
#       })

#       audio_stream = resp.audio_stream.read
#       return audio_stream

#     end

#   end

#   def self.generate_audio(language, content)
#     if language == 'es'
#       engine = 'neural'
#       language_code = 'es-ES'
#       voice_id = 'Sergio'
#     end

#     audio = Audio_Voice.new(engine, language_code, content, voice_id)
#     audio_data = audio.get_audio
#     return audio_data
#   end

# # rescue StandardError => ex
# #   puts 'Got error:'
# #   puts 'Error message:'
# #   puts ex.message

# end
