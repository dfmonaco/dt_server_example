class BrowserDatatables < DatatablesServer::Base
  attr_reader :view

  def initialize(view)
    super(view.params)
    @view = view
  end

  def data
    Browser.all
  end

  def columns
    %w(browsers.engine browsers.browser browsers.platform browsers.version browsers.grade)
  end

  def engine(raw_engine)
    raw_engine.upcase
  end

  def version(raw_version)
    view.number_with_precision(raw_version)
  end

end
