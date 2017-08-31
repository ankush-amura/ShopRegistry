class SalesController < ApplicationController
  def new
  end

  def edit
  end

  def index
  end

  def create
     @sale=Sale.new(sale_params)
     @moderator=Moderator.find_by_id(session[:current_moderator_id])
     @moderator.sales << @sale
    if @moderator.save!
      redirect_to(controller: 'moderators' , action: 'index')
    end
  end
  def sale_params
    params.require(:sales).permit(:name,:email,:password,:contact)
  end
end
