class FileCompressionJob < ApplicationJob
  queue_as :default

  def perform(file_upload_id)
    file_upload = FileUpload.find(file_upload_id)

    if file_upload.file.attached?
      # Compression logic (e.g., for images, videos, etc.)
    end
  end
end
