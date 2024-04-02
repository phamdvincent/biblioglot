require "aws-sdk-s3"

# module Storage_Service
  # Wraps Amazon S3 resource actions.
# class BucketListWrapper
#   attr_reader :s3_resource

#   # @param s3_resource [Aws::S3::Resource] An Amazon S3 resource.
#   def initialize(s3_resource)
#     @s3_resource = s3_resource
#   end

#   # Lists buckets for the current account.
#   #
#   # @param count [Integer] The maximum number of buckets to list.
#   def list_buckets(count)
#     puts "Found these buckets:"
#     @s3_resource.buckets.each do |bucket|
#       puts "\t#{bucket.name}"
#       count -= 1
#       break if count.zero?
#     end
#     true
#   rescue Aws::Errors::ServiceError => e
#     puts "Couldn't list buckets. Here's why: #{e.message}"
#     false
#   end
# end

# Example usage:
module Storage_Service
  def self.save_to_storage(content, filename, content_type)
    # wrapper = BucketListWrapper.new(Aws::S3::Resource.new)
    s3_client = Aws::S3::Client.new
    bucket_name = 'biblioglot'
    file_path = filename + '.mp3'
    audio_content = content

    if content_type == 'sentence'
      object_key = 'audio_es_sentences/' + file_path
    elsif content_type == 'word'
      object_key = 'audio_es_words/' + file_path
    end

    s3_client.put_object({
      bucket: bucket_name,
      key: object_key,
      body: audio_content
    })
    # wrapper.list_buckets(25)
  end
end
# end

