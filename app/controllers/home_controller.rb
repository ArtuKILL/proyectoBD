class HomeController < ApplicationController

  layout "home"

  def index
    Cliente.connection
    @atributos = Cliente.inspect.scan(/\w+/)
    @titulo = @atributos.slice!(0)
  end
end
