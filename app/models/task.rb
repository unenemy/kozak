class Task < ActiveRecord::Base
  belongs_to :project
  has_many :time_logs
end
