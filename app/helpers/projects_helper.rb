module ProjectsHelper

	def format_description(project)
		content_tag(:strong, project.description)
	end	
	def format_budget(project)
		if project.estimated?
			content_tag(:strong, 'not estimated')
		else
			content_tag(:strong, number_to_currency(project.estimated_budget))
		end
	end

	def format_is_strategic(project)
		if project.is_strategic?
			content_tag(:strong, 'yes')
		else
			content_tag(:strong, 'no')
		end
	end

	def format_status(project)
		case project.status
		when 'open'
  			content_tag(:span, 'open', :class => "label pull-right label-success")
		when 'close'  
  			content_tag(:span, 'closed', :class => "label pull-right label-info")
		when 'suspended'
  			content_tag(:span, 'suspended', :class => "label pull-right label-default")
  		else
  			content_tag(:span, 'transferred', :class => "label pull-right label-warning")
		end
	end
end
