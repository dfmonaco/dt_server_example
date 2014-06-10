class BrowsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {render json: BrowserDatatables.new(Browser.all)}
    end
  end
end

