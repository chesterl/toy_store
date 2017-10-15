class MessagesController < ApplicationController
  before_action :load_seller, only: :create
  before_action :redirect_if_seller_missing, only: :new

  def index
    @messages = load_messages.includes(:from, :to)
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message sucessfully sent!' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:to_id, :content)
    end

    def load_seller
      @seller = Seller.find(message_params[:to_id])
    end

    def redirect_if_seller_missing
      @seller = Seller.find(params[:to_id])

      return redirect_to messages_path unless @seller.present?
    end

    def load_messages
      @sent = params[:sent]
      if @sent
        current_user.sent_messages
      else
        current_user.received_messages
      end
    end
end
