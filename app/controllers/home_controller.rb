class HomeController < ApplicationController

  layout "home"

  def index
    
    Agency.connect
      
    @atributos = Cliente.inspect.scan(/\w+/)
    @titulo = @atributos.slice!(0)

    # @agencies = agencies_url.all.select(:nombre_agencia)
  end

  def header
     @agencies = Agency.all  
  end

end
