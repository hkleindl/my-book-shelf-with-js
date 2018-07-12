module ApplicationHelper

  def login_page?
    !!current_page?(root_path)  
  end

  def signup_page?
    params[:controller] == "users" && (params[:action] == "new" || params[:action] == "create")
  end

end
