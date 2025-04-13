module ApplicationHelper
  def aws_shared_url(file_path)
    fog_connection = Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-southeast-1'
    )

    # Truy cập đối tượng S3 mà bạn muốn tạo presigned URL
    file = fog_connection.directories.get('vinschool-one').files.get(file_path)

    # Tạo presigned URL với thời gian hết hạn (ví dụ: 1 giờ)
    file.url(Time.now + 60)
  end
end
