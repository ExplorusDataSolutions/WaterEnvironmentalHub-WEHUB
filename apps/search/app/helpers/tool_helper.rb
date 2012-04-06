module ToolHelper

  def add_param_ids_array(params)
    if params[:id]
      params[:ids] = params[:id]
      params.delete(:id)
    end
    params
  end
  
end
