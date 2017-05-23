require 'rails_helper'

describe HealthChecksController do
  it 'performs a health check' do
    get :status

    expect(response.status).to eq 200
  end

  it 'performs a complete check' do
    expect(ActiveRecord::Base.connection).to receive(:execute)

    get :complete

    expect(response.status).to eq 200
  end
end
