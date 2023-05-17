class Api::V1::AuthController < ApplicationController
    protect_from_forgery
    def signin
        param = params[:auth]
        user = User.find_by(email: param['email'])
        if user && user.authenticate(param['password'])
            token = generate_token(user)
            response = {
                data:{
                    id: user.id,
                    type: "users",
                    attributes: {
                        token: token,
                        email: param['email'],
                        name: user.firstName + " " + user.lastName,
                        country: user.country,
                        createdAt: user.created_at,
                        updatedAt: user.updated_at,
                    }
                }
            }
            render json: response, status: :ok
        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end 
    end

    def generate_token(user)
        payload = { user_id: user.id }
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
end
