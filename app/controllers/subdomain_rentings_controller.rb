class SubdomainRentingsController < ApplicationController
  layout 'gite'
  def index
  end

  def simulator
    render 'pages/simulator'
  end
end
