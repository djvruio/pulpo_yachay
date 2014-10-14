module TasksHelper
	
	def format_task_status(task)
		case task.status
		when 'open'
  			content_tag(:span, 'open', :class => "label pull-right label-success")
		when 'close'  
  			content_tag(:span, 'close', :class => "label pull-right label-info")
		when 'delayed'
  			content_tag(:span, 'delayed', :class => "label pull-right label-danger")
  		else
  			content_tag(:span, 'in_progress', :class => "label pull-right label-warning")
		end
	end

	def format_task_complexity(task)
		case task.complexity
		when 'low'
  			content_tag(:span, 'low', :class => "label pull-right label-success") 
		when 'medium'  
  			content_tag(:span, 'medium', :class => "label pull-right label-info") 
  		else
  			content_tag(:span, 'high', :class => "label pull-right label-warning") 
		end
	end
	
end
