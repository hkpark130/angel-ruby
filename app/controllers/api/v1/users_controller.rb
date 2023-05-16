class Api::V1::UsersController < ApplicationController
    protect_from_forgery
    def signup
        user = User.new
        user.firstName = params[:firstName]
        user.lastName = params[:lastName]
        user.email = params[:email]
        user.password = params[:password]
        user.country = params[:country]
        user.save
    end
end
