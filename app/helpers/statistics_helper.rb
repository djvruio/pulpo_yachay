module StatisticsHelper
 # Función que permite calcular el porcentaje de avance de los proyectos
  # a razón del avance de tareas
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
      case (task.status)
      when 'open'
        sum_open_work+=complexity_value(task)
      when 'close'
      	sum_closed_work+=complexity_value(task)
      when 'delayed'
        sum_delayed_work+=complexity_value(task)
      when 'in_progress'
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

	def generate_chart_bars(projects)
		chart=[['Projects', 'Progress', 'Remaining', 'Link']]
		row=1
		projects.each do |project|
			tasks=project.tasks
			stats=calculate_statistics(tasks)
			chart[row]=[project.name,stats,(1.to_f - stats.to_f), project_path(project)]
			#      puts "fila: #{row}"
			row+=1
		end	

		return chart
	end  

  def calculate_estimates_work(tasks)
    sum_work=0
    tasks.each do |task|
      sum_work+=task.estimated_work
    end
    return sum_work
  end

  def calculate_completed_work(tasks)
    sum_work=0
    tasks.each do |task|
      sum_work+=task.completed_work
    end
    return sum_work
  end

  def calculate_remaining_work(tasks)
    sum_work=0
    tasks.each do |task|
      sum_work+=task.remaining_work
    end
    return sum_work
  end	
end
