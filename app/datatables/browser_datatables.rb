class BrowserDatatables < DatatablesServer::Base

  def data
    Browser.all
  end

  def columns
    %w(browsers.engine browsers.browser browsers.platform browsers.version browsers.grade)
  end

end
