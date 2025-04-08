module ApplicationHelper
  def aws_public_url(file_name)
    credentials = Rails.application.credentials
    [credentials.aws[:endpoint], credentials.aws[:bucket], 'shared', file_name].join('/')
  end
end
