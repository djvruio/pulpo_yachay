module StatisticsHelper
 	def generate_chart_bars(projects)
		chart=[['Projects', 'Progress', 'Remaining', 'Link']]
		row=1
		projects.each do |project|
			tasks=project.tasks
			stats=calculate_statistics(tasks)
			chart[row]=[project.name,stats,(1.to_f - stats.to_f), project_tasks_path(project)]
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
