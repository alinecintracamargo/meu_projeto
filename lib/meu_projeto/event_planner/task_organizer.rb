# lib/meu_projeto/event_planner/task_organizer.rb

class TaskOrganizer
  def initialize(participants, tasks)
    @participants = participants
    @tasks = tasks
  end

  def organize_tasks(event_date)
    # Verifica se há participantes e tarefas
    if @participants.empty? || @tasks.empty?
      puts "Não há participantes ou tarefas para organizar."
      return
    end

    # Permite que cada participante escolha uma tarefa
    @participants.each do |participant|
      puts "#{participant.name}, por favor escolha uma tarefa:"
      display_available_tasks
      task_index = gets.chomp.to_i

      # Verifica se a escolha é válida
      if valid_choice?(task_index)
        selected_task = @tasks.delete_at(task_index - 1)
        participant.assign_task(selected_task)
      else
        puts "Escolha inválida. Tente novamente."
        redo
      end
    end

    # Exibe as tarefas organizadas
    display_tasks

    # Retorna a data do evento
    event_date
  end

  private

  def display_available_tasks
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

  def valid_choice?(index)
    index > 0 && index <= @tasks.length
  end

  def display_tasks
    puts "Resumo das escolhas:"
    @participants.each do |participant|
      puts "#{participant.name} escolheu: #{participant.task}"
    end
  end
end
