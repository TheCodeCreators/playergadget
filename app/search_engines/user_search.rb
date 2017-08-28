module UserSearch
  SORTABLES = %w[users.id name username email users.created_at current_sign_in_at].freeze

  class << self
    def get(params, per_page=nil)
      query_params = []
      filters = []
      params.each do |param, value|
        next unless respond_to?("#{param}_condition") && value.present?
        filter, value = send("#{param}_condition", value)
        query_params << value unless value.nil?
        filters << filter
      end

      unless per_page.nil?
        users = User.where(filters.join(' and '), *query_params.flatten)
                    .order(sort_criteria(params))
                    .paginate(page: params[:page], per_page: per_page)
      end
      users
    end

    def search_text_condition(param)
      criteria = "%(#{param.downcase.tr(' ', '|')})%"
      ['(lower(first_name) similar to ? or lower(username)
         similar to ? or lower(email) like ? or lower(last_name) similar to ?)',
       [criteria, criteria, "%#{param.downcase}%", criteria]]
    end

    def start_date_condition(param)
      ['created_at >= ?', Date.parse(param)]
    end

    def end_date_condition(param)
      ['created_at <= ?', Date.parse(param)]
    end

    def user_type_condition(param)
      ['? = ANY (roles) AND ? != ALL (roles)', [param, param.to_i + 1]]
    end

    private

    def sort_criteria(params)
      "#{sort_column(params)} #{sort_order(params)} nulls last"
    end

    def sort_column(params)
      sort = params[:sort] || 'users.id'
      sort = sort[1..-1] if sort.start_with?('-')
      SORTABLES.include?(sort) ? sort : 'users.id'
    end

    def sort_order(params)
      return 'desc' unless params[:sort]
      params[:sort].start_with?('-') ? 'desc' : 'asc'
    end
  end
end
