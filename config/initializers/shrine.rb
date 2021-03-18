# frozen_string_literal: true

require 'cloudinary'
require 'shrine/storage/cloudinary'
Cloudinary.config(
  cloud_name: 'jarfsoft',
  api_key: '369256481934598',
  api_secret: 'V4PAZmcNvPOIucQtt2PGS2PAntE'
)
Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: 'article_page/cache'), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: 'article_page')
}
Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation
