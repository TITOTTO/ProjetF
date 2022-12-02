class CartsController < ApplicationController
  before_action :checklog

  def index
    @user = current_user
    @total = 0
    @user.carts.each do |cart| # On passe sur tous les articles pour récupérer le total des prix
      @total = @total + cart.article.price
    end
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(user: current_user, article_id: params[:article_id])
      if @cart.save
        redirect_to "/user/#{current_user.id}/carts" 
        flash[:notice] = "Article was successfully created."
      else
        @cart.errors.full_messages.each do |msg|
        flash[:error] = msg
        end
        redirect_to root_path
      end
  end

  def destroy
    @cart = Cart.find(params[:cart_id])
    @cart.destroy
    redirect_to user_carts_path(current_user)
  end

  def checklog
    if user_signed_in?
    else
      flash[:error] = "Tu n'es pas connecté" 
      redirect_to "/"
    end
  end

end
