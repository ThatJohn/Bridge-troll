class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chats_channel'
  end
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # stop_all_streams
  end
  
  def speak(data)
    Message.create! content: data['message'], user: current_user, region_id: data['region']
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

  def regionId
    @id = params[:id]
  end

end