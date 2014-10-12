module ProjectsHelper
	def format_budget(project)
		if project.estimated?
			content_tag(:strong, 'not estimated')
		else
			number_to_currency(project.estimated_budget)
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
  			content_tag(:span, 'open', :class => "badge pull-right alert-success")
		when 'close'  
  			content_tag(:strong, 'closed', :class => "badge pull-right alert-info")
		when 'suspended'
  			content_tag(:strong, 'suspended', :class => "badge pull-right")
  		else
  			content_tag(:strong, 'transferred', :class => "badge pull-right alert-warning")
		end
	end
end
