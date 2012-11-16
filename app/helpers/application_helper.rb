module ApplicationHelper
  def form_errors(model)
    render :partial => 'shared/model_errors', :locals => { :model => model }
  end
end
