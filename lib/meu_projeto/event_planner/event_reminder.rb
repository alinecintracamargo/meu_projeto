
class EventReminder
  def initialize(participants)
    @participants = participants
  end

  def send_reminders(event_date, days_before)
    reminder_date = event_date - days_before
    puts "Enviando lembretes em: #{reminder_date.strftime("%d/%m/%Y")}"
    @participants.each do |participant|
      puts "Enviando lembrete para #{participant.name} no email #{participant.email}"
    end
  end
end
