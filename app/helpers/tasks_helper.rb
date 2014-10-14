module TasksHelper
	
	def format_task_status(task)
		case task.status
		when 'open'
  			content_tag(:span, 'open', :class => "badge pull-right alert-success")
		when 'close'  
  			content_tag(:span, 'close', :class => "badge pull-right alert-info")
		when 'delayed'
  			content_tag(:span, 'delayed', :class => "badge pull-right")
  		else
  			content_tag(:span, 'in_progress', :class => "badge pull-right alert-warning")
		end
	end

	def format_task_complexity(task)
		case task.complexity
		when 'low'
  			content_tag(:span, 'low', :class => "badge pull-right alert-success")
		when 'medium'  
  			content_tag(:span, 'medium', :class => "badge pull-right alert-info")
  		else
  			content_tag(:span, 'high', :class => "badge pull-right alert-warning")
		end
	end
	
end
