module TasksHelper
	def format_task_states(task)
		case task.state.name
		when 'OPEN'
  			var_class='label pull-right label-warning'
		when 'CLOSED'
  			var_class='label pull-right label-success'
		when 'DELAYED'
  			var_class='label pull-right label-danger'
  		when 'IN PROGRESS'
  			var_class='label pull-right label-progress'
		end				
		content_tag(:span, task.state.name, :class => var_class)					
	end

  def format_My_task_states(task)
    case task.state_id
      when 1
        content_tag(:label, 'ABIERTA', :class => 'label pull-right label-warning')
      when 2
        content_tag(:label, 'CERRADA', :class => 'label pull-right label-success')
      when 3
        content_tag(:label, 'RETRASADA', :class => 'label pull-right label-danger')
      else
        content_tag(:label, 'EN PROGRESO', :class => 'label pull-right label-progress')
    end

  end


  def format_assigned_to(task)
    if task.assigned_to_id.present?
      content_tag(:span,task.assigned.try(:email) , :class => "label pull-right label-warning")
    else
      content_tag(:span, 'Not one assigned', :class => "label pull-right label-warning")
    end
  end	

	def format_task_complexity(task)
		case task.complexity
		when 'easier'
  			content_tag(:span, 'easier', :class => "label pull-right label-success") 
		when 'easy'
  			content_tag(:span, 'easy', :class => "label pull-right label-success") 
		when 'medium'  
  			content_tag(:span, 'medium', :class => "label pull-right label-info") 
		when 'dificult'
  			content_tag(:span, 'dificult', :class => "label pull-right label-danger") 
		when 'very_dificult'
  			content_tag(:span, 'very_dificult', :class => "label pull-right label-danger") 
		end
  end

  def format_My_task_complexity(task)
    #binding.pry
    case task.complexity
      when '(1 día) easier'
        content_tag(:label, 'Muy Facil', :class => "label pull-right label-success")
      when '(2 días) easy'
        content_tag(:label, 'Facil', :class => "label pull-right label-success")
      when '(3 días) medium'
        content_tag(:label, 'Media', :class => "label pull-right label-info")
      when '(4 días) dificult'
        content_tag(:label, 'Dificil', :class => "label pull-right label-danger")
      when '(5 días) very_dificult'
        content_tag(:label, 'Muy Dificil', :class => "label pull-right label-danger")
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
