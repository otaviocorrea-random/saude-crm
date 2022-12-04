
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

  def render_field_data(title, content)
    "<div class=\"card mb-3\">
      <div class=\"card-header\">
        #{title}
      </div>
      <div class=\"card-body\">
        <blockquote class=\"blockquote mb-0\">
          <p>#{content}</p>
        </blockquote>
      </div>
    </div>".html_safe
  end

  def datalist_municipios
    html = "<datalist id=\"lista_municipios\">"
    html += options_for_select(Municipio.all.eager_load(:estado).map { | municipio | municipio.nome_listagem_formatado })
    html += "</datalist>"
    html.html_safe
  end
end
