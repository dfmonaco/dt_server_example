module DatatablesServer
  def initialize(params)
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

  attr_reader :params

  def s_echo
    params[:sEcho].to_i
  end

  def i_total_records
    data.count
  end

  def i_total_display_records
    filtered_data.count
  end

  def aa_data
    paginated_data.map do |datum|
      attributes.inject([]) do |array, column|
        array << datum.public_send(column)
      end
    end
  end

  def attributes
    # binding.pry
    @attributes ||= columns.map do |column|
      column.split('.').last
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
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0]
  end

  def filtered_data
    # filter(data)
    return data if params[:sSearch].empty?
    data.where(conditions, search: "%#{params[:sSearch]}%")
  end

  def conditions
    columns.join(' LIKE :search OR ') << ' LIKE :search'
  end
end
