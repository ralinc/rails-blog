require 'rails_helper'

describe HealthCheckController do
  it 'returns 200 OK response status' do
    get :status

    response.status.should eq 200
  end
end
