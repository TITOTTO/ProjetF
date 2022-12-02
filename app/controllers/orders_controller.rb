class OrdersController < ApplicationController

  def new
    @order = current_user.orders.last
  end

  def create
    @stripe_amount = 500
    begin  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
    })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to user_carts_path(current_user)
    end

    Order.create(user_id: current_user.id, amount: @stripe_amount)
    current_user.carts.each do |cart|
      @article = Article.find(cart.article_id)
      @article.update(order_id: Order.last.id, buyer: current_user)
      cart.destroy
    end
    redirect_to new_order_path
  end

end
