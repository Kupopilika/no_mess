module ApplicationHelper
  def current_class?(test_path)
    if request.path == test_path
      return 'navbar-brand active-perso'
    else
      return 'navbar-brand'
    end
  end
end
