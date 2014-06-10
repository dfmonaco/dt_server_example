class DatatablesController < ApplicationController
  def index
    @data = Datatable.all
  end
end

