
require_relative '../spec_helper'
require_relative '../../lib/meu_projeto/event_planner/date_suggester'

RSpec.describe DateSuggester do
  describe '.ask_best_date' do
    it 'asks the user for the best date and returns it' do
      valid_dates = ["20/07/2024", "16/11/2024", "14/12/2024", "18/01/2025"]
      allow($stdin).to receive(:gets).and_return('16/11/2024')

      chosen_date = DateSuggester.ask_best_date

      expect(valid_dates).to include(chosen_date)
    end

    it 'repeats the prompt until a valid date is chosen' do
      allow($stdin).to receive(:gets).and_return('20/06/2025', '16/11/2024')

      chosen_date = DateSuggester.ask_best_date

      expect(chosen_date).to eq("16/11/2024")
    end
  end
end
