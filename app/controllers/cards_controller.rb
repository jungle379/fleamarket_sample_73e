class CardsController < ApplicationController

  before_action :move_to_root 
  before_action :set_card,    only: [:new, :show, :destroy, :buy, :pay]
  require "payjp"

  def new
    redirect_to card_path(current_user.id) if @card.present?
    @card = CreditCard.new
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
    end
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to new_card_path
      end
  end

  def show
    if @card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      case @card_info.brand
        when "Visa"
          @card_src = "visa.gif"
        when "JCB"
          @card_src = "jcb.gif"
        when "MasterCard"
          @card_src = "mc.png"
        when "American Express"
          @card_src = "amex.gif"
        when "Diners Club"
          @card_src = "diners.gif"
        when "Discover"
          @card_src = "discover.gif"
      end
    end
  end

  def destroy
    if @card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to cards_path
  end

  
  def index
  end

  private
  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end


  
end

