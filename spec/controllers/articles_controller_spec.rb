require 'rails_helper'

describe ArticlesController do
  let(:article) { create :article }

  describe 'guest user' do
    it 'cannot filter articles' do
      get :index, params: {status: 'wip'}
      expect(response).to redirect_to(login_url)
    end

    it 'cannot view WiP article' do
      article = create :wip_article
      get :show, params: {id: article}
      expect(response).to redirect_to(login_url)
    end

    it 'cannot open new article page' do
      get :new
      expect(response).to redirect_to(login_url)
    end

    it 'cannot create article' do
      post :create
      expect(response).to redirect_to(login_url)
    end

    it 'cannot edit article' do
      get :edit, params: {id: article}
      expect(response).to redirect_to(login_url)
    end

    it 'cannot update article' do
      put :update, params: {id: article}
      expect(response).to redirect_to(login_url)
    end

    it 'cannot delete article' do
      delete :destroy, params: {id: article}
      expect(response).to redirect_to(login_url)
    end
  end

  describe 'authenticated user' do
    let(:user) { create :user }

    before do
      create_session_for user
    end

    describe 'creates article' do
      context '(valid data)' do
        let(:valid_data) { attributes_for(:article, status: 'published') }

        it 'creates new article' do
          expect do
            post :create, params: {article: valid_data}
          end.to change(Article, :count).by(1)
        end
      end

      context '(invalid data)' do
        let(:invalid_data) { attributes_for(:article, title: '', status: 'wip') }

        it 'does not create new article' do
          expect do
            post :create, params: {article: invalid_data}
          end.not_to change(Article, :count)
        end
      end
    end

    describe 'edits article' do
      let(:article) { create :article }
    end

    describe 'updates article' do
      context '(valid data)' do
        let(:valid_article) do
          attributes_for(:article, title: 'new', slug: article.slug, status: 'published')
        end

        it 'redirects to article' do
          put :update, params: {id: article, article: valid_article}
          expect(response).to redirect_to(article)
        end

        it 'updates article' do
          put :update, params: {id: article, article: valid_article}
          expect(article.reload.title).to eq('new')
        end
      end

      context '(invalid data)' do
        let(:invalid_article) { attributes_for(:article, title: '', status: 'wip') }

        it 'does not update article' do
          put :update, params: {id: article, article: invalid_article}
          expect(article.reload.status).not_to eq(Article.statuses[:wip])
        end
      end
    end

    describe 'deletes article' do
      it 'redirects to articles' do
        delete :destroy, params: {id: article}
        expect(response).to redirect_to(articles_path)
      end

      it 'deletes article' do
        delete :destroy, params: {id: article}
        expect(Article.exists?(article.id)).to be_falsy
      end
    end
  end
end
