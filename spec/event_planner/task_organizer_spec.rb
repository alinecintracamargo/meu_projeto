
require_relative '../spec_helper'
require_relative '../../lib/meu_projeto/event_planner/task_organizer'
require_relative '../../lib/meu_projeto/event_planner/participants'

RSpec.describe TaskOrganizer do
  describe '#update_task_status' do
    it 'updates the status of tasks' do
      participants = [
        Participant.new("Família Camargo", "camargo@example.com"),
        Participant.new("Família Cintra", "cintra@example.com"),
        Participant.new("Família Cruz", "cruz@example.com")
      ]

      TaskOrganizer.update_task_status(participants, "Família Camargo", "concluída")

      expect(participants[0].task_status).to eq("concluída")
    end
  end
end
