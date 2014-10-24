module ApplicationHelper
# Función que permite calcular el porcentaje de avance de los proyectos
  # a razón del avance de tareas
  def calculate_percentage_statistics(tasks)
  	percentage=(calculate_statistics(tasks)*100).to_f.round(2)
  end

  def calculate_statistics(tasks)
    #Status {'OPEN'=>1,'CLOSE'=>2,'DELAYED'=>3,'IN_PROGRESS'=>4}
    #Complexity {'EASIER'=>1,'EASY'=>2,'MEDIUM'=>3,'DIFICULT'=>4,'VERY_DIFICULT'=>5}
    sum_complexity_work=0
    sum_open_work=0
    sum_closed_work=0
    sum_delayed_work=0
    sum_in_progress_work=0
    sum_work=0

    tasks.each do |task|
      sum_complexity_work+=complexity_value(task)
      case (task.state.name)
      when 'OPEN'
        sum_open_work+=complexity_value(task)
      when 'CLOSED'
      	sum_closed_work+=complexity_value(task)
      when 'CLOSED'
        sum_delayed_work+=complexity_value(task)
      when 'IN PROGRESS'
        sum_in_progress_work+=complexity_value(task)
      end      
    end
    
#   puts "======================="
#   puts 'total'
#   puts sum_completed_work
#   puts sum_work
	percent_work=sum_closed_work.to_f/sum_complexity_work.to_f
	#   puts "%5.2f" % percent_#   puts "percent_work= #{percent_work.round(3)}"
	return percent_work.to_f.round(3)
	end

	def complexity_value(task)
		return task[:complexity].to_f + 1
	end	
end
