class HomeController < ApplicationController

  layout "home"

  def index
    Cliente.connection
    @atributos = Cliente.inspect.scan(/\w+/)
    @titulo = @atributos.slice!(0)

    # @agencies = agencies_url.all.select(:nombre_agencia)
  end
end
