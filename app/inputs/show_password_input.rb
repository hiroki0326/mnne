class ShowPasswordInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    template.content_tag(:div,class: inline_wapper_class) do
      template.content_tag(:div, class: 'input-group show-password') do
        template.concat @builder.password_field(attribute_name, input_html_options.merge(data: {input: true}))
        template.concat show_table
      end
    end
  end

  def input_html_options
    _class = %w(form-control show-password-input)
    _class << 'is-invalid' if has_errors?
    super.merge(class: _class.join(" "))
  end

  def inline_wapper_class
    _class = ['']
    _class << 'is-invalid' if has_errors?
    _class.join(" ")
  end

  def show_table
    template.content_tag(:span, class: 'input-group-append',title: 'clear',data: {clear: true}) do
      template.concat tag.span(icon_show,class: 'show-password-btn-box')
    end
  end

  def icon_show
    "<i class='fa fa-eye-slash text-dark show-password-btn'></i>".html_safe
  end
end