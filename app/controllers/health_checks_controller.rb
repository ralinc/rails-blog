class HealthChecksController < ApplicationController
  def status
    head :ok
  end

  def complete
    ActiveRecord::Base.connection.execute 'SELECT 1'

    head :ok
  end
end
