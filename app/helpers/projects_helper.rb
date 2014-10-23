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

  def format_is_critic(project)
    if project.is_critic?
      content_tag(:strong, '¡is critic!', :class => "label-warning")
    else
      content_tag(:strong, 'is not critic', :class => "label-success")
    end
  end

	def format_is_strategic(project)
		if project.is_strategic?
			content_tag(:strong, 'yes')
		else
			content_tag(:strong, 'no')
		end
	end

	def format_status(project,align)
		if align===''
			opc_align=align
		else
			opc_align='pull-'+align
		end
		case project.status
		when 'open'
  			content_tag(:span, 'open', :class => "label #{opc_align} label-progress")
		when 'closed'
  			content_tag(:span, 'closed', :class => "label #{opc_align} label-success")
		when 'suspended'
      content_tag(:span, 'suspended', :class => "label #{opc_align} label-default")
  		else
  			content_tag(:span, 'transferred', :class => "label #{opc_align} label-warning")
    end
	end
end
