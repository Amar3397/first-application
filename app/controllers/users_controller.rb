class UsersController < ApplicationController
  
=begin

  http_basic_authenticate_with
  name:"amar", password:"12345",
  except: [:index, :show, :create, :edit, :update, :distroy :search,]

=end
  
  def index
    @users=User.all
  end

  def search
  @users=User.where(email:params[:var])
 end

def find
  @users=User.where(pincode:params[:var2])
end
  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render:new
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if
      @user.update(user_params)
      redirect_to users_path
    else
      render:edit
       
     end 
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user) .permit(:first_name, :last_name, :email, :mobile_no, :date_of_birth, :address, :pincode)
end
end
