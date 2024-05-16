module DateSuggester
  def self.ask_best_date
    valid_dates = ["20/07/2024", "16/11/2024", "14/12/2024", "18/01/2025"]
    chosen_date = nil

    until valid_dates.include?(chosen_date)
      puts "Qual a melhor data para o evento: #{valid_dates.join(', ')}"
      chosen_date = $stdin.gets.chomp
    end

    chosen_date
  end
end
