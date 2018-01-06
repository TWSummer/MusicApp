module ApplicationHelper

  def authenticate
    html = "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{h(form_authenticity_token)}\">"
    html.html_safe
  end

  def show_errors(errors)
    html = ""
    if errors
      errors.each do |error|
        html += "<p>#{h(error)}</p><br>"
      end
    end
    html.html_safe
  end
end
