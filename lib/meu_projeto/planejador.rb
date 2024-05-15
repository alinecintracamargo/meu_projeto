require 'date'  # Adiciona esta linha para carregar a biblioteca date
require_relative 'event_planner/task_organizer'
require_relative 'event_planner/event_reminder'
require_relative 'event_planner/date_suggester'
require_relative 'participants'

# Pergunta ao usuário pela data do evento
chosen_date_str = DateSuggester.ask_best_date

# Converte a string escolhida para um objeto Time
event_date = Date.strptime(chosen_date_str, "%d/%m/%Y")

# Exibe a data do evento
puts "A data do evento foi escolhida: #{event_date.strftime("%d/%m/%Y")}"

# Lista de participantes
participants = [
  Participant.new("Família Camargo", "camargo@example.com"),
  Participant.new("Família Cintra", "cintra@example.com"),
  Participant.new("Família Cruz", "cruz@example.com")
]

# Lista de tarefas
tasks = ["Lugar e Decoração", "Comida e Bebidas", "Músicas e Jogos"]

# Inicializa o organizador de tarefas
task_organizer = TaskOrganizer.new(participants, tasks)

# Organiza as tarefas
task_organizer.organize_tasks(event_date)

# Inicializa o reminder
event_reminder = EventReminder.new(participants)

# Envia lembretes 7 dias antes do evento
event_reminder.send_reminders(event_date, 7)
