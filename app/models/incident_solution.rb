class IncidentSolution < ActiveRecord::Base
  # Incident
  belongs_to :incident

  # Solution
  belongs_to :solution
end
