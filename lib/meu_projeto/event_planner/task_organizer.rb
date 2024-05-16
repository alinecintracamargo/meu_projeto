

module TaskOrganizer
  def self.update_task_status(participants, participants_name, status)
    participants.each do |participant|
      if participant.name == participants_name 
        participant.task_status = status
      end
    end
  end


  def choose_order
    ordered_participants = []
    available_participants = @participants.dup

    until available_participants.empty?
      puts "Escolha a próxima família para selecionar a tarefa:"
      available_participants.each_with_index do |participant, index|
        puts "#{index + 1}. #{participant.name}"
      end

      choice = gets.chomp.to_i - 1

      if choice >= 0 && choice < available_participants.length
        ordered_participants << available_participants.delete_at(choice)
      else
        puts "Escolha inválida. Tente novamente."
      end
    end

    @participants = ordered_participants
  end

  def organize_tasks
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
  end

  def update_task_status
    @participants.each do |participant|
      puts "#{participant.name}, por favor atualize o status da sua tarefa (pendente, em andamento, concluída):"
      status = gets.chomp.downcase
      participant.update_task_status(status)
    end

    display_task_statuses
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
      puts "#{participant.name} escolheu: #{participant.task} (Status: #{participant.task_status})"
    end
  end

  def display_task_statuses
    puts "Atualização de status das tarefas:"
    @participants.each do |participant|
      puts "#{participant.name} - Tarefa: #{participant.task} - Status: #{participant.task_status}"
    end
  end
end
