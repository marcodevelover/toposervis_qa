module ApplicationHelper
    def controller?(*controller)
        controller.include?(params[:controller])
    end

    def action?(*action)
        action.include?(params[:action])
    end

    def asset_exists?(subdirectory, filename)
        File.exists?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
    end

    def image_exists?(image)
        asset_exists?('images', image)
    end

    def javascript_exists?(script)
        extensions = %w(.coffee .erb .coffee.erb) + [""]
        extensions.inject(false) do |truth, extension|
            truth || asset_exists?('javascripts', "#{script}.js#{extension}")
        end
    end

    def stylesheet_exists?(stylesheet)
        extensions = %w(.scss .erb .scss.erb) + [""]
        extensions.inject(false) do |truth, extension|
            truth || asset_exists?('stylesheets', "#{stylesheet}.css#{extension}")
        end
    end

    def pack_exists?(filename)
        File.exists?(File.join(Rails.root, 'app', 'javascript', 'packs', "#{filename}.js"))
    end

    def title_section(*args) 
        render   'admin/shared/title' 
    end

    def link_to_add_fields(name = nil, f = nil, association = nil, options = nil, html_options = nil, &block)
      # If a block is provided there is no name attribute and the arguments are
      # shifted with one position to the left. This re-assigns those values.
      f, association, options, html_options = name, f, association, options if block_given?

      options = {} if options.nil?
      html_options = {} if html_options.nil?

      if options.include? :locals
        locals = options[:locals]
      else
        locals = { }
      end

      if options.include? :partial
        partial = options[:partial]
      else
        partial = association.to_s.singularize + '_fields'
      end

      # Render the form fields from a file with the association name provided
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, new_object, child_index: 'new_record') do |builder|
        render(partial, locals.merge!( f: builder))
      end

      # The rendered fields are sent with the link within the data-form-prepend attr
      html_options['data-form-prepend'] = raw CGI::escapeHTML( fields )
      html_options['href'] = '#'

      content_tag(:a, name, html_options, &block)
    end
end
