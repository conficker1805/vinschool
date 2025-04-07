module ApplicationHelper
  def aws_public_url(file_name)
    "http://localhost:9000/vinschool/shared/#{file_name}"
  end
end
