# frozen_string_literal: true

class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])

    # Custom validation
    if resource.present? && resource.valid_password?(params[:user][:password])
      # If the resource is valid, sign in the user
      sign_in(resource_name, resource)
      redirect_to root_path, notice: 'Signed In successfully'
    else
      # If validation fails, respond with an error
      render json: { error: 'Invalid email or password.' }, status: :unprocessable_entity
    end
  end

end
