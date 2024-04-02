require "aws-sdk-s3"

module Storage
  class StorageService
    def self.save_to_storage(content, filename, content_type)
      s3_client = Aws::S3::Client.new
      bucket_name = "biblioglot"
      file_path = filename + ".mp3"
      audio_content = content

      if content_type == "sentence"
        object_key = "audio_es_sentences/" + file_path
      elsif content_type == "word"
        object_key = "audio_es_words/" + file_path
      end

      s3_client.put_object({
        bucket: bucket_name,
        key: object_key,
        body: audio_content,
      })

      return object_key
    end
  end
end

# module StorageService
#   def self.save_to_storage(content, filename, content_type)
#     s3_client = Aws::S3::Client.new
#     bucket_name = 'biblioglot'
#     file_path = filename + '.mp3'
#     audio_content = content

#     if content_type == 'sentence'
#       object_key = 'audio_es_sentences/' + file_path
#     elsif content_type == 'word'
#       object_key = 'audio_es_words/' + file_path
#     end

#     s3_client.put_object({
#       bucket: bucket_name,
#       key: object_key,
#       body: audio_content
#     })

#     return object_key
#   end
# end
