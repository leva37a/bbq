CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     Rails.application.credentials.yc[:aws_access_key_id],
    aws_secret_access_key: Rails.application.credentials.yc[:aws_secret_access_key],
    region:                'ru-central1',
    endpoint:              'https://storage.yandexcloud.net'
  }
  config.fog_directory  = Rails.application.credentials.yandex_bucket
end
