
require_relative 'spec_helper'
require_relative '../../lib/meu_projeto/event_planner/participants'

RSpec.describe Participant do
  let(:participant) { Participant.new("Família Camargo", "camargo@example.com") }

  it 'assigns a task to the participant' do
    participant.assign_task("Comida e Bebidas")
    expect(participant.task).to eq("Comida e Bebidas")
  end

  it 'updates the task status' do
    participant.update_task_status("concluída")
    expect(participant.task_status).to eq("concluída")
  end
end
