module TasksHelper


  def format_assigned_to(task)
    if task.assigned_to_id.present?
      content_tag(:span,task.assigned.try(:email) , :class => "label pull-right label-warning")
    else
      content_tag(:span, 'Not one assigned', :class => "label pull-right label-warning")
    end
  end

	def format_task_status(task)
		case task.status
		when 1
  			content_tag(:span, 'open', :class => "label pull-right label-warning")
		when 2
  			content_tag(:span, 'close', :class => "label pull-right label-success")
		when 3
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
    if task.deadline.present?
        date_actual=DateTime.now.to_date.to_s
        date_dl_task=task.deadline.to_date.to_s
        if (date_dl_task >= date_actual)
          content_tag(:span, '',:class=>"glyphicon glyphicon-flag in-progress")
        else
          content_tag(:span, '', :class => "glyphicon glyphicon-flag delayed")
        end
    else
      content_tag(:span, '',:class=>"glyphicon glyphicon-flag No Set Yet")
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
