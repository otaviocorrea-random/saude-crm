module ApplicationHelper
  def model_error_alert(errors)
    return '' if errors.blank?
    html = ''
    html += "<div class='alert alert-danger mt-3 mb-3' role='alert'>"
    html += "<h2>#{errors.count} erro(s) encontrados:</h2>"
    html += "<ul>"
    errors.full_messages.each do |message|
      html += "<li>#{message}</li>"
    end
    html += "</ul>"
    html += "</div>"
    html.html_safe
  end
end
