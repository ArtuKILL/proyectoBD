class HomeController < ApplicationController
  def index
    Cliente.all
    @atributos = Cliente.inspect.scan(/\w+/)
    @titulo = @atributos.slice!(0)
  end
end
