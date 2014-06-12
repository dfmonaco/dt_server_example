class BrowserDatatables
  include DatatablesServer

  private

  def columns
    %w(engine browser platform version grade)
  end

end
