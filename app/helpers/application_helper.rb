module ApplicationHelper
  def rails_to_bootstrap_alert(name)
    case name
    when 'success', 'info', 'warning', 'danger'
      return name
    when 'notice'
      return 'info'
    when 'alert'
      return 'warning'
    else
      return 'danger'
    end
  end
end
