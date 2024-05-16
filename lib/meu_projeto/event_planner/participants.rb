
class Participant
  attr_reader :name, :email
  attr_accessor :task, :task_status

  def initialize(name, email)
    @name = name
    @email = email
    @task = nil
    @task_status = 'pendente'
  end

  def assign_task(task)
    @task = task
  end

  def update_task_status(status)
    @task_status = status
  end
end
