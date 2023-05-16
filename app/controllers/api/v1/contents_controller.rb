class Api::V1::ContentsController < ApplicationController
    def get
        @contents = Post.all
        render json: @contents
    end
end
