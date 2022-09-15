module InputHelper

  def divide_inputs(builder,divide_method,firstly_method,secondly_method,options={})
    builder.input(divide_method,options) do
      wrapper_classes = %w(form-group)
  
      field_classes = %w(form-control)
      if builder.object.errors.has_key?(firstly_method)
        field_classes << 'is-invalid'
      end
      firstly_input_type = options[:input_type] || builder.object.class.columns_hash[firstly_method.to_s].try(:type)
      firstly_input = case firstly_input_type
      when :string
        builder.text_field(firstly_method,class: field_classes)
      when :integer,:decimal
        builder.number_field(firstly_method,class: field_classes)
      when :date
        builder.date_field(firstly_method,class: field_classes)
      when :time
        builder.time_field(firstly_method,class: field_classes)
      else
        builder.text_field(firstly_method,class: field_classes)
      end
      firstly_label = builder.label(firstly_method)

      field_classes = %w(form-control)
      if builder.object.errors.has_key?(secondly_method)
        field_classes << 'is-invalid'
      end
      secondly_input_type = options[:input_type] || builder.object.class.columns_hash[secondly_method.to_s].try(:type)
      secondly_input = case secondly_input_type
      when :string
        builder.text_field(secondly_method,class: field_classes)
      when :integer,:decimal
        builder.number_field(secondly_method,class: field_classes)
      when :date
        builder.date_field(secondly_method,class: field_classes)
      when :time
        builder.time_field(secondly_method,class: field_classes)
      else
        builder.text_field(secondly_method,class: field_classes)
      end
      secondly_label = builder.label(secondly_method)

      tag.div(class: wrapper_classes) do
        src = ActiveSupport::SafeBuffer.new
        tag.div(class: 'form-name-boxes') do
          src << content_tag(:div,{class: "form-box"},false) do
            src_inner = ActiveSupport::SafeBuffer.new
            src_inner << builder.input(firstly_method) do
              firstly_input
            end
          end
          src << content_tag(:div,{class: "form-box"},false) do
            src_inner = ActiveSupport::SafeBuffer.new
            src_inner << builder.input(secondly_method) do
              secondly_input
            end
          end
        end
      end
    end
  end

  def telephone_inputs(builder,telephone_method,one_method,two_method,three_method,options={})
    builder.input(telephone_method,options) do
      wrapper_classes = %w(form-group)
      field_classes = %w(form-control)
   
      one_input = builder.telephone_field(one_method, size: 8, maxlength: 4, class: builder.object.errors.has_key?(one_method) ? field_classes + %w(is-invalid) : field_classes)
      two_input = builder.telephone_field(two_method, size: 8, maxlength: 4, class: builder.object.errors.has_key?(two_method) ? field_classes + %w(is-invalid) : field_classes)
      three_input = builder.telephone_field(three_method, size: 8, maxlength: 4, class: builder.object.errors.has_key?(three_method) ? field_classes + %w(is-invalid) : field_classes)

      base = ActiveSupport::SafeBuffer.new
      base << tag.div(class: wrapper_classes) do
        src = ActiveSupport::SafeBuffer.new
        tag.div(class: 'form-telephone-boxes') do
          tag.div(class: 'form-box') do
            src << content_tag(:div,{class: "box"},false) do
              src_inner = ActiveSupport::SafeBuffer.new
              src_inner << builder.input(one_method, label: false) do
                one_input
              end
            end
            src << content_tag(:div,{class: "box"},false) do
              src_inner = ActiveSupport::SafeBuffer.new
              src_inner << builder.input(two_method, label: false) do
                two_input
              end
            end
            src << content_tag(:div,{class: "box"},false) do
              src_inner = ActiveSupport::SafeBuffer.new
              src_inner << builder.input(three_method, label: false) do
                three_input
              end
            end
          end
        end
      end
      base << tag.div(class: 'invalid-feedback d-block') do
        src = ActiveSupport::SafeBuffer.new
        src << builder.error(telephone_method)
      end
      
    end
  end

  def postcode_inputs(builder,postcode_method,one_method,two_method,options={})
    builder.input(postcode_method) do
      wrapper_classes = %w(form-group)
      field_classes = %w(form-control)
   
      one_input = builder.text_field(one_method, size: 3, maxlength: 3, class: builder.object.errors.has_key?(one_method) ? field_classes + %w(is-invalid) : field_classes)
      two_input = builder.text_field(two_method, size: 4, maxlength: 4, class: builder.object.errors.has_key?(two_method) ? field_classes + %w(is-invalid) : field_classes)

      base = ActiveSupport::SafeBuffer.new
      base << tag.div(class: wrapper_classes) do
        src = ActiveSupport::SafeBuffer.new
        tag.div(class: 'form-postcode-boxes') do
          tag.div(class: 'form-box') do
            src << content_tag(:div,{class: "box"},false) do
              src_inner = ActiveSupport::SafeBuffer.new
              src_inner << builder.input(one_method, label: false) do
                one_input
              end
            end
            src << content_tag(:div,{class: "box"},false) do
              src_inner = ActiveSupport::SafeBuffer.new
              src_inner << builder.input(two_method, label: false) do
                two_input
              end
            end
            src << content_tag(:div,{class: "box"},false) do
              src_inner = ActiveSupport::SafeBuffer.new
              src_inner << tag.button(options.merge(class: 'button-outline-primary btn-zip-search', type: "button")) do
                "住所を自動入力"
              end
            end
          end
        end
      end
      base << tag.div(class: 'invalid-feedback d-block') do
        src = ActiveSupport::SafeBuffer.new
        src << builder.error(postcode_method)
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
        builder.date_field(from_method,class: field_classes,max: '2999-12-31')
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
        builder.date_field(to_method,class: field_classes,max: '2999-12-31')
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


end