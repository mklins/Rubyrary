module ApplicationHelper
    include Pagy::Frontend

    def currently_at(current_page = '')
        render partial: 'shared/menu', locals: { current_page: current_page }
    end

    def nav_tab(title, url, options = {})
        current_page = options.delete :current_page
    
        css_class = current_page == title ? 'text-black' : 'text-secondary'
    
        options[:class] = if options[:class]
                            "#{options[:class]} #{css_class}"
                          else
                            css_class
                          end
        link_to title, url, options
      end

    def pagination(obj)
        raw(pagy_bootstrap_nav(obj)) if obj.pages > 1
    end

    def full_title(page_title = '')
        base_title = 'Rubyrary'
        if page_title.present?
          "#{page_title} | #{base_title}"
        else
          base_title
        end
      end
end
