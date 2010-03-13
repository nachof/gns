
module FormHelper
  def field_wrap(method, text=method.to_s.humanize, options={}, &field_block)
    class_name = ["form", options.delete(:group_class)].compact.join(" ")

    label_options = { :object => @object }
    label = @template.label(@object_name, method, text, label_options)

    suffix = options[:suffix].blank? ? "" : " <span class='suffix'>#{options.delete(:suffix)}</span>"
    prefix = options[:prefix].blank? ? "" : "<span class='prefix'>#{options.delete(:prefix)}</span> "
    hint = options.delete(:hint)

    ret  = '<dl class="' + class_name + '">'
    ret << '<dt>' + label + '</dt>'
    ret << '<dd>' + prefix + field_block.call(options) + suffix + '</dd>'
    ret << '<dd class="hint">' + hint + '</dd>' if hint.present?
    ret << '<dd class="required" title="Required Field">Required Field</dd>' if options[:required]
    ret << '</dl>'
    ret.html_safe
  end

  def text_group(method, text=method.to_s.humanize, options={})
    field_wrap(method, text, options) do |inner_options|
      class_name = "textfield " + (inner_options[:class].nil? ? "" : inner_options[:class])
      @template.text_field(@object_name, method, inner_options.merge(:object => @object, :class => class_name))
    end
  end

  def text_area_group(method, text=method.to_s.humanize, options={})
    field_wrap(method, text, options) do |inner_options|
      class_name = "textfield " + (inner_options[:class].nil? ? "" : inner_options[:class])
      @template.text_area(@object_name, method, inner_options.merge(:object => @object, :class => class_name))
    end
  end

  def password_group(method, text=method.to_s.humanize, options={})
    field_wrap(method, text, options) do |inner_options|
      class_name = "textfield " + (inner_options[:class].nil? ? "" : inner_options[:class])
      @template.password_field(@object_name, method, inner_options.merge(:object => @object, :class => class_name))
    end
  end

  def text_area_group(method, text=method.to_s.humanize, options={})
    field_wrap(method, text, options) do |inner_options|
      @template.text_area(@object_name, method, inner_options.merge(:object => @object))
    end
  end

  def select_group(method, choices, text=method.to_s.humanize, options={}, html_options={})
    field_wrap(method, text, options) do |inner_options|
      @template.select(@object_name, method, choices, inner_options.merge(:object => @object), html_options)
    end
  end

  def time_zone_select_group(method, text, priority_zones=nil, options={}, html_options={})
    field_wrap(method, text, options) do |inner_options|
      @template.time_zone_select(@object_name, method, priority_zones, inner_options.merge(:object => @object), html_options)
    end
  end

  def check_box_group(method, text=method.to_s.humanize, options={}, checked_value="1", unchecked_value="0")
    field_wrap(method, text, options) do |inner_options|
      @template.check_box(@object_name, method, inner_options.merge(:object => @object, :class => "checkbox"), checked_value, unchecked_value)
    end
  end

  def radio_group(method, text, choices, options={})
    options_for_items = options.delete(:options_for_items) || {}
    field_wrap(method, text, options) do |inner_options|
      choices.map do |value, label|
        val_for_label = label || value.to_s.humanize
        @template.content_tag :span, options_for_items do
          item = @template.label(@object_name, method, val_for_label, :value => val_for_label)
          item << @template.radio_button(@object_name, method, value, inner_options.merge(:object => @object, :class => "radio_button"))
        end
      end.join
    end
  end

  def file_group(method, text=method.to_s.humanize, options={})
    field_wrap(method, text, options) do |inner_options|
      @template.file_field(@object_name, method, inner_options.merge(:object => @object, :class => "filefield"))
    end
  end

  def date_group(method, text=method.to_s.humanize, options={})
    default_date = (@object.send(method) || options.delete(:default_date) || Date.today).to_s(:standard)
    options.reverse_merge!(:value => default_date, :group_class => "date")
    text_group(method, text, options)
  end

  def submit_group(submit_text='Guardar', cancel_text='Cancelar', options = {})
    cancel_link = options.delete(:cancel_link) || "javascript:history.go(-1)"

    ret = '<div class="form-actions">'
    ret << "<a href=\"#{cancel_link}\" class=\"cancel-link\">" + cancel_text + '</a>' unless options.delete(:no_cancel)
    ret << @template.submit_tag(submit_text, options.merge(:class => "submit-button"))
    ret << '</div>'
    ret.html_safe
  end
end

ActionView::Helpers::FormBuilder.send :include, FormHelper
