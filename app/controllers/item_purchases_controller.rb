class ItemPurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @subscriber = ItemPurchasesForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @subscriber = ItemPurchasesForm.new(subscriber_params)
    if @subscriber.valid?
      pay_item
      @subscriber.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def subscriber_params
    params.require(:item_purchases_form).permit(:postal_code, :prefecture_id, :city, :phone_number, :building_name, :address).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.value,  # 商品の値段
      card: subscriber_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
