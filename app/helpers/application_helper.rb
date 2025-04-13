module ApplicationHelper
  def aws_shared_url(file_path)
    if Rails.env.production?
      fog_connection = Fog::Storage.new(
        provider: 'AWS',
        aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
        aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
        region: 'ap-southeast-1'
      )

      file = fog_connection.directories.get('vinschool-one').files.get(file_path)
      file.url(Time.now + 60)
    else
      credentials = Rails.application.credentials
      [credentials.aws[:endpoint], credentials.aws[:bucket], file_path].join('/')
    end
  end
end
