class BrowserDatatables
  include DatatablesServer

  private

  def data
    Browser.all
  end

  def columns
    %w(browsers.engine browsers.browser browsers.platform browsers.version browsers.grade)
  end

end
