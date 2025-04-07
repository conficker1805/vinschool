CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: Rails.application.credentials.aws[:region],
    endpoint: Rails.application.credentials.aws[:endpoint],
    force_path_style: true,
    signature_version: 'v4',
  }
    config.fog_directory  = Rails.application.credentials.aws[:bucket]
    config.fog_public     = true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{7.days.to_i}" }
end
