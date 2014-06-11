# int  iTotalRecords Total records, before filtering (i.e. the total number of records in the database)

# int  iTotalDisplayRecords  Total records, after filtering (i.e. the total number of records after
#      filtering has been applied - not just the number of records being returned in this result set)

# string  sEcho An unaltered copy of sEcho sent from the client side. This parameter will change with
#         each draw (it is basically a draw count) - so it is important that this is implemented.
#         Note that it strongly recommended for security reasons that you 'cast' this parameter
#         to an integer in order to prevent Cross Site Scripting (XSS) attacks.

# array aaData  The data in a 2D array.
#
# params[:sSearch]
# params[:iDisplayStart]
# params[:iDisplayLength]
# params[:iSortCol_0]
# params[:sSortDir_0]

class BrowserDatatables
  def initialize(table, params)
    @table = table
    @params = params
  end

  def as_json(options = {})
    {
      sEcho: s_echo,
      iTotalRecords: i_total_records,
      iTotalDisplayRecords: i_total_display_records,
      aaData: aa_data
    }
  end

  private

  attr_reader :table
  attr_reader :params

  def s_echo
    params[:sEcho].to_i
  end

  def i_total_records
    table.count
  end

  def i_total_display_records
    filtered_data.count
  end

  def aa_data
    paginated_data.map do |datum|
      [
        datum.engine,
        datum.browser,
        datum.platform,
        datum.version,
        datum.grade
      ]
    end
  end

  def paginated_data
    # paginate(ordered_data)
    ordered_data.limit(page_size).offset(page_start)
  end

  def page_size
    params[:iDisplayLength]
  end

  def page_start
    params[:iDisplayStart]
  end

  def ordered_data
    # order(filtered_data)
    filtered_data.order("#{sort_column} #{sort_direction}")
  end

  def sort_column
    %w(engine browser platform version grade)[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0]
  end

  def filtered_data
    # filter(table)
    table
  end

end
