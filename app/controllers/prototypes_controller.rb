class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
    @prototype = Prototype.new
    # @user_id = Prototype.user_id
  end

  def new
    @prototype = Prototype.new
  end

  def create
      @prototype = Prototype.new(prototype_params)
      if @prototype.save
      redirect_to root_path
      else
      render :new
      end
  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
    # .includes(:user)
    # # redirect_to prototype_comments_path(@prototype) ,method: :post
    # @user = User.current_id
    
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @prototype= Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
