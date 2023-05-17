require 'bcrypt'

class Api::V1::UsersController < ApplicationController
    include BCrypt

    protect_from_forgery
    def signup
        user = User.new
        user.firstName = params[:firstName]
        user.lastName = params[:lastName]
        user.email = params[:email]
        user.password_digest = BCrypt::Password.create(params[:password])
        user.country = params[:country]
        user.save
    end
end
