class Api::V1::ContentsController < ApplicationController
    def get
        @contents = Post.all
        render json: @contents
    end

    protect_from_forgery
    def post
        post = Post.new
        post.title = params[:title]
        post.body = params[:body]
        post.save
    end

    protect_from_forgery
    def delete
        post = Post.find(params[:id])
        post.destroy
        response = {
            message: "Deleted"
        }
        render json: response
    end
end
