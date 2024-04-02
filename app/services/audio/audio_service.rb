# Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# This file is licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License. A copy of the
# License is located at
#
# http://aws.amazon.com/apache2.0/
#
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS
# OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'aws-sdk-polly'  # In v2: require 'aws-sdk'
require 'securerandom'


module Audio_Service

  class Audio_Voice
    def initialize(engine, language_code, content, voice_id)
      @polly = Aws::Polly::Client.new
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

      first_part = SecureRandom.uuid
      mp3_file = first_part + '.mp3'

      IO.copy_stream(resp.audio_stream, mp3_file)

      puts 'Wrote MP3 content to: ' + mp3_file
    end

  end

  def self.generate_audio(language, content)
    if language == 'es'
      engine = 'standard'
      language_code = 'es-ES'
      voice_id = 'Lucia'
    end

    audio = Audio_Voice.new(engine, language_code, content, voice_id)
    audio.get_audio
  end

# rescue StandardError => ex
#   puts 'Got error:'
#   puts 'Error message:'
#   puts ex.message

end

# begin
#   # Get the filename from the command line
#   if ARGV.empty?()
#     puts 'You must supply a filename'
#     exit 1
#   end

#   filename = ARGV[0]

#   # Open file and get the contents as a string
#   if File.exist?(filename)
#     contents = IO.read(filename)
#   else
#     puts 'No such file: ' + filename
#     exit 1
#   end

#   # Create an Amazon Polly client using
#   # credentials from the shared credentials file ~/.aws/credentials
#   # and the configuration (region) from the shared configuration file ~/.aws/config
#   polly = Aws::Polly::Client.new

#   resp = polly.synthesize_speech({
#     engine: "standard",
#     language_code: "es-MX",
#     output_format: "mp3",
#     text: contents,
#     voice_id: "Mia",
#   })

#   # Save output
#   # Get just the file name
#   #  abc/xyz.txt -> xyx.txt
#   name = File.basename(filename)

#   # Split up name so we get just the xyz part
#   parts = name.split('.')
#   first_part = parts[0]
#   mp3_file = first_part + '.mp3'

#   IO.copy_stream(resp.audio_stream, mp3_file)

#   puts 'Wrote MP3 content to: ' + mp3_file
# rescue StandardError => ex
#   puts 'Got error:'
#   puts 'Error message:'
#   puts ex.message
# end
