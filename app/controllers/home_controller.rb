class HomeController < ApplicationController 
  def index
    @request = Request.new
    @requests = Request.take(3)

    @category = Category.new
    @categories = Category.all
  end


  def generate_token
    @client_token = Braintree::ClientToken.generate()
  end

  def purchase
    nonce = params[:payment_method_nonce]
    amount = params[:amount]
    result = Braintree::Transaction.sale(
      :amount => amount,
      :payment_method_nonce => "nonce-from-the-client"
    )

    if result.success?
      flash[:message] = "Thank you for your donation! We received an amount of $#{amount} from you."
    else
      flash[:alert] = "Ooops. There was an error processing the payment."
    end
    redirect_to root_path
  end
end
