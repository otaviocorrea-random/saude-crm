
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

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => WillPaginate::BootstrapLinkRenderer
    end
    super *[collection_or_options, options].compact
  end
end
