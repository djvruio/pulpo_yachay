module TasksHelper
	
	def format_task_status(task)
		case task.status
		when 'open'
  			content_tag(:span, 'open', :class => "label pull-right label-warning")
		when 'close'  
  			content_tag(:span, 'close', :class => "label pull-right label-success")
		when 'delayed'
  			content_tag(:span, 'delayed', :class => "label pull-right label-danger")
  		else
  			content_tag(:span, 'in_progress', :class => "label pull-right label-progress")
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

	def flag_task_deadline(task)
		date_actual=DateTime.now.to_date.to_s
		date_dl_task=task.deadline.to_date.to_s
#		date_created_task=task.created_at.to_date.to_s

		if (date_dl_task >= date_actual)
			content_tag(:span, '',:class=>"glyphicon glyphicon-flag in-progress")
		else
			content_tag(:span, '', :class => "glyphicon glyphicon-flag delayed")
		end
	end

	def is_new_task(action)
		case action
		when 'new'
			value=true
		when 'edit'
			value=false
		end 
		#binding.pry
		return value
	end
	
end
