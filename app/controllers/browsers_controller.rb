class BrowsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json {render json: Browser.all}
      # format.json {render json: BrowserServer.new(Browser.all)}
    end
  end
end

