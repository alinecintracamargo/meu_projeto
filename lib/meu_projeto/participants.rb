# lib/meu_projeto/participants.rb

class Participant
  attr_reader :name, :email
  attr_accessor :task

  def initialize(name, email)
    @name = name
    @email = email
    @task = nil
  end

  def assign_task(task)
    @task = task
  end
end
