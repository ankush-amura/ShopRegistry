class SalesController < ApplicationController
  def new
  end

  def index
  session[:current_sales_person_id]=2
  @sale=Sale.find(session[:current_sales_person_id])
  @shops=@sale.shops
  @area=[]
  @city=[]
  @category=[]
    @shops.each do |shop|
         @area_id=Shop.where(name: shop.name, property_type: 'Area').first.property_id
         @category_id=Shop.where(name: shop.name, property_type: 'Category').first.property_id
         @city_id=Area.find(@area_id).city_id
         @category.push(Category.find(@category_id))
         @city.push(City.find(@city_id))
         @area.push(Area.find(@area_id))
        end
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

  def edit
    @shop=Shop.find(params[:id])
    @city_names=[]
    City.all.each do |city|
    @city_names.push(city.name)
    end
    @area_names=[]
    Area.all.each do |area|
    @area_names.push(area.name)
    end
    @area=Area.find(Shop.where(name: @shop.name,property_type: "Area").first.property_id)
    @city=@area.city
    @category_shop=Category.find(Shop.where(name: @shop.name,property_type: "Category").first.property_id)
    @categories=Category.all
    @category_names=[]
     @categories.each do |category|
     puts category.name
     @category_names.push(category.name)
     end
     render('update')
  end

  def remove
   Shop.find(id).destroy
   redirect_to(controller: 'sales' , action: 'index')
  end
end
