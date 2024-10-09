class FileUploadsController < ApplicationController
  before_action :authenticate_user!, except: :show_public

  def share
    @file_upload = current_user.file_uploads.find(params[:id])
    if @file_upload
      render json: { tiny_url: file_public_url(@file_upload.tiny_url) }
    else
      redirect_to root_path, alert: "File not found"
    end
  end

  def show_public
    @file_upload = FileUpload.find_by(tiny_url: params[:tiny_url])

    if @file_upload
      send_file @file_upload.file.path, disposition: :inline
    else
      redirect_to root_path, alert: "File not found"
    end
  end

  def new
    @file_upload = FileUpload.new
  end

  def show
    @file_uploads = FileUpload.where(user: current_user)
  end

  def create
    @file_upload = current_user.file_uploads.new(file_upload_params)

    if @file_upload.save
      # Optional: Compress the file using a background job if necessary
      FileCompressionJob.perform_later(@file_upload.id) if @file_upload.requires_compression?
      flash[:notice] = 'File uploaded successfully'
    else
      render :errors
    end
  end

  private

  def file_upload_params
    params.require(:file_upload).permit(:title, :description, :file)
  end
end
