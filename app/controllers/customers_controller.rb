class CustomersController < ApplicationController
  def new
  end
  def index
     @shops=Shop.where(property_type: 'Area')
     @area=[]
     @city=[]
     @shops.each do |shop|
       area_id=shop.property_id
       @area.push(Area.find(area_id))
       @city.push(Area.find(area_id).city)
     end
  end

  def comment
  render('comment')
  end

  def edit

  end
end
