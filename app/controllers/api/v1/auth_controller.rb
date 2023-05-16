class Api::V1::AuthController < ApplicationController
    protect_from_forgery
    def signin
        param = params[:auth]
        user = User.new
        user.email = param['email']
        user.password = param['password']

        response = {
            data:{
                id: 1,
                type: "users",
                attributes: {
                    token: "HEADER.PAYLOAD.SIGNATURE",
                    email: param['email'],
                    name: "",
                    country: "",
                    createdAt: "",
                    updatedAt: "",
                }
            }
        }
        render json: response
    end
end
