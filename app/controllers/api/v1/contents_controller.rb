class Api::V1::ContentsController < ApplicationController
    before_action :authorize_request, only: [:get, :post, :delete, :put]

    def get
        @contents = Post.all
        render json: @contents
    end

    protect_from_forgery
    def post
        post = Post.new
        post.title = params[:title]
        post.body = params[:body]
        post.writer = @current_user_id
        post.save
    end

    protect_from_forgery
    def delete
        post = Post.find(params[:id])
        unless post.writer.to_i == @current_user_id
            render json: { error: 'Authorization failed' }, status: :unauthorized
            return
        end
        post.destroy
        response = {
            message: "Deleted"
        }
        render json: response
    end

    protect_from_forgery
    def put
        post = Post.find(params[:id])
        unless post.writer.to_i == @current_user_id
            render json: { error: 'Authorization failed' }, status: :unauthorized
            return
        end
        post.title = params[:title]
        post.body = params[:body]
        post.save
        response = {
            data:{
                id: post.id,
                type: "content",
                attributes: {
                    title: post.title,
                    body: post.body,
                    createdAt: post.created_at,
                    updatedAt: post.updated_at,
                }
            }
        }
        render json: response
    end

    def authorize_request
        header = request.headers['Authorization']
        token = header&.split(' ')&.last

        unless token && (decoded_token = JwtService.decode(token))
            render json: { error: 'Unauthorized' }, status: :unauthorized
            return
        end

        @current_user_id = decoded_token['user_id']
    end
end
