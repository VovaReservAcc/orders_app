 module ApplicationHelper
 def link_to_add_row(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end
#  def add_record_link(form_builder, method, caption, options = {}, html_options = {})
#     options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
#     options[:partial] ||= method.to_s.singularize
#     options[:form_builder_local] ||= :f
#     options[:insert] ||= method
#     callback = options.delete(:callback)
#     temp_id = options[:object].object_id

#     fields_method = form_builder.class.name == 'SimpleForm::FormBuilder' ? :simple_fields_for : :fields_for
#     index_method  = options[:object].is_a?(OpenStruct) ? :index : :child_index

#     html = ''
#     form_builder.send(fields_method, method, options[:object], index_method => temp_id) do |f|
#       html << render(:partial => options[:partial], :locals => { options[:form_builder_local] => f }.merge(options.delete(:locals) || {}))
#     end

#     link_to(caption, 'javascript:void(0)', class: "add-new-field #{html_options[:class]}", data: { id: temp_id, target: "##{options[:insert]}", fields: html.delete("\n").tr('"', "'") }.merge(callback.present? ? { callback: callback } : {}))
#   end
  end