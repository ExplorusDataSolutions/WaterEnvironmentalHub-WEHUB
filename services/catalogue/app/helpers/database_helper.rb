module DatabaseHelper

  def execute(sql_params)
    if sql_params.kind_of?(Array)
      sql = ActiveRecord::Base.send(:sanitize_sql_array, sql_params)
    else
      sql = sql_params
    end
    ActiveRecord::Base.connection.execute(sql)
  end

end
