class ModeratorsController < ApplicationController
  def new
  end

  def edit
  end

  def index
    session[:current_moderator_id]=2

    @moderator=Moderator.find_by_id(session[:current_moderator_id])
    # we get moderators that belongs to that superadmins
    @sales= @moderator.sales

  end

  # this action is responsible for running the creation of the new moderator by the superadmin
  def create
   # here moderator object is created with parameters
   @moderator = Moderator.new(moderator_params)
   puts "--------------"
   # printing session variable on console
   puts session[:current_user_id]
   # searching for superadmin under which this moderator should exists
   @superadmin=Superadmin.find_by_id(session[:current_user_id])
   # inserting the moderator inside the superadmin
   @superadmin.moderators << @moderator
   # checking if the superadmin is valid to be saved
   if @superadmin.save!
     # redirecting the controller to the index page after adding is successfull
     redirect_to(controller: "superadmins" , action: "index")
   end
end

  def moderator_params
   # permiting porameters provide us with facility to prevent security attacks
   params.require(:moderator).permit(:name,:email,:contact,:password)
  end

  # this method is responsible for deleting the sale person
  def delsale
    # getting the moderator responsible for current session sales persons
    @moderator=Moderator.find_by_id(session[:current_moderator_id])
    # we get salesperson that belongs to that moderator
    @sales = @moderator.sales
    # we see if a delete is pressed bcz on delete pressed we will get id in the link
    if params[:id]
      # deleting the particular sale person
      Sale.find(params[:id]).destroy
      # redirecting to the delete page again after delete
      redirect_to controller: "moderators" ,action:"delsale"
    end
  end
end
