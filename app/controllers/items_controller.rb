class ItemsController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
             
    @item = Item.find(params[:id])
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path 
       
    end
   end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :preparation_id, :value, :image).merge(user_id: current_user.id)
  end
  def set_prototype
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end

