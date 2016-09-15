require 'rails_helper'

describe TagsController do
  let(:tag) { create :tag }

  it 'renders articles by tag name' do
    get :show, id: tag
    expect(response).to render_template(:show)
  end
end
