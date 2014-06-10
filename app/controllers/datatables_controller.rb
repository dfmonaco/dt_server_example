class DatatablesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {render json: Datatable.all}
    end
  end
end

