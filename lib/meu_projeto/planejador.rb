require 'date'
require_relative 'event_planner/task_organizer'
require_relative 'event_planner/event_reminder'
require_relative 'event_planner/date_suggester'
require_relative 'participants'


chosen_date_str = DateSuggester.ask_best_date

event_date = Date.strptime(chosen_date_str, "%d/%m/%Y")


puts "A data do evento foi escolhida: #{event_date.strftime("%d/%m/%Y")}"

participants = [
  Participant.new("Família Camargo", "camargo@xxxxx.com"),
  Participant.new("Família Cintra", "cintra@xxxxx.com"),
  Participant.new("Família Cruz", "cruz@xxxxx.com")
]

tasks = ["Lugar e Decoração", "Comida e Bebidas", "Músicas e Jogos"]

task_organizer = TaskOrganizer.new(participants, tasks)

task_organizer.choose_order

task_organizer.organize_tasks

task_organizer.update_task_status

event_reminder = EventReminder.new(participants)

event_reminder.send_reminders(event_date, 7)
