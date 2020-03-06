class ChatsController < ApplicationController
    before_action :authenticate_user!

    def index
        @chats = authorize Region.all
    end

    def show
        @messages = authorize Message.where(region_id: params[:id])
    end

end