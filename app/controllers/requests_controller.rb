class RequestsController < ApplicationController
  def create
    @request = Request.create(request_params)
    redirect_to root_path
  end

  def request_params
    params.require(:request).permit!
  end
end
