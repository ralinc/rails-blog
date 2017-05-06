require 'rails_helper'

describe HealthCheckController do
  it 'returns 200 OK response status' do
    get :status

    expect(response.status).to eq 200
  end
end
