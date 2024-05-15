# lib/meu_projeto/event_planner/date_suggester.rb

class DateSuggester
  def self.ask_best_date
    valid_dates = ["20/07/2024", "16/11/2024", "14/12/2024", "18/01/2025"]

    loop do
      puts "Qual melhor data para o evento: " + valid_dates.join(', ')

      user_choice = gets.chomp

      if valid_dates.include?(user_choice)
        puts "Você escolheu #{user_choice} como a melhor data para o evento."
        return user_choice
      else
        puts "Escolha inválida. Por favor, escolha entre " + valid_dates.join(', ') + "."
      end
    end
  end
end
