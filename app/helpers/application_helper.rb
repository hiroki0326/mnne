module ApplicationHelper
  def localize(*args)
    I18n.localize(*args)
  rescue
    nil
  end
  alias_method :l,:localize

  def noimage_tag(size,options={})
    text = (options.delete(:text).presence || "no+image")
    image_tag "https://via.placeholder.com/#{size}.png?text=#{text}",options.merge(size: size)
  end

  def resize_options(size="200x200")
    width,height = size.split('x')
    {resize_to_fit: [width,height]}
  end

  def combine_options(size="200x200")
    {combine_options: {resize:"#{size}^",crop:"#{size}+0+0",gravity: :center}}
  end

  def page_naviation(collection)
    render partial: 'page_naviation',locals: {collection: collection}
  end

  def page_title_navigation(*args)
    options = args.extract_options!
    options.reverse_merge!(title: @page_title,back_to: "javascript:history.back()",no_navi: false)
    render partial: 'page_title_navi',locals: options
  end

  def card_empty
    render 'card_empty'
  end

  def check_tag(value)
    if value
      tag.i('',class: "fa fa-check text-success")
    else
      tag.i('',class: "fa fa-ban text-danger")
    end
  end

  def sidebar_collapse_attributes(element_id)
    {}.tap do |hash|
      hash[:id] = element_id
      if @active_sidebar_items.include?(element_id)
        hash['aria-expanded'] = "true"
        hash['class'] = 'show'
      else
      end
    end
  end

  def sort_guide
    tag.div("行をドラッグすると並び替えができます",class: "text-info mb-4")
  end

  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def toast_class(name)
    case name.to_sym
    when :notice,:success
      'toast-notice'
    when :alert,:danger
      'toast-error'
    else
      'toast-info'
    end
  end

  def order_item_status_text(order_item)
    if order_item.canceled?
      "キャンセル済"
    elsif order_item.handed?
      "お渡し済"
    elsif order_item.pick_up
      if order_item.sold_out?
        "欠品中"
      elsif order_item.package_item
        if order_item.package_item.sold_out?
          if order_item.package_item.arranged?
            "欠品（手配中）"
          else
            "欠品（手配待）"
          end
        else
          "事前ピッキング済"
        end
      else
        "事前ピッキング中"
      end
    else
      "未処理"
    end
  end

  def textbook_media_type_tag(textbook)
    if textbook.media_type.ebook?
      tag.div(class: 'my-2') do
        tag.span(textbook.media_type_text,class: "badge badge-secondary")
      end
    end
  end

  def range_inputs(builder,range_method,from_method,to_method,options={})
    builder.input(range_method,options) do
      wrapper_classes = %w(form-inline)
      field_classes = %w(form-control)
      if builder.object.errors.has_key?(range_method)
        wrapper_classes << 'is-invalid'
        field_classes << 'is-invalid'
      end
      from_input_type = options[:input_type] || builder.object.class.columns_hash[from_method.to_s].try(:type)
      from_input = case from_input_type
      when :string
        builder.text_field(from_method,class: field_classes)
      when :integer,:decimal
        builder.number_field(from_method,class: field_classes)
      when :date
        builder.date_field(from_method,class: field_classes)
      when :time
        builder.time_field(from_method,class: field_classes)
      else
        builder.text_field(from_method,class: field_classes)
      end

      to_input_type = options[:input_type] || builder.object.class.columns_hash[to_method.to_s].try(:type)
      to_input = case to_input_type
      when :string
        builder.text_field(to_method,class: field_classes)
      when :integer,:decimal
        builder.number_field(to_method,class: field_classes)
      when :date
        builder.date_field(to_method,class: field_classes)
      when :time
        builder.time_field(to_method,class: field_classes)
      else
        builder.text_field(to_method,class: field_classes)
      end

      tag.div(class: wrapper_classes) do
        src = ActiveSupport::SafeBuffer.new
        src << content_tag(:div,{class: "input-group mr-2"},false) do
          src_inner = ActiveSupport::SafeBuffer.new
          src_inner << from_input
          src_inner << tag.div(class: "input-group-append") do
            tag.span("から",class: "input-group-text")
          end
          src_inner
        end
        src << content_tag(:div,{class: "input-group"},false) do
          src_inner = ActiveSupport::SafeBuffer.new
          src_inner << to_input
          src_inner << tag.div(class: "input-group-append") do
            tag.span("まで",class: "input-group-text")
          end
          src_inner
        end
      end
    end
  end

  def coop_member_only?(textbook,user,univ)
    return true if user.blank?
    return false if textbook.blank? || univ.blank?
    return true unless univ.use_coopism_account?

    case textbook.media_type
    when 'ebook'
      return user.member?
    end
    return true
  end
end
