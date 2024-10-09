class FileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  # validates :title, presence: true
  # validates :file, attached: true, size: { less_than: 1.gigabyte, message: 'File size must be under 1GB' }

  before_save :detect_file_type
  before_create :generate_tiny_url

  def generate_tiny_url
    self.tiny_url = SecureRandom.hex(6) # This will generate a 6 character unique hex
  end

  def detect_file_type
    self.file_type = file.blob.content_type
  end
end
