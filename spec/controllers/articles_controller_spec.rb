require 'rails_helper'

describe ArticlesController do
  shared_examples 'public access to articles' do
    describe 'GET index' do
      it 'renders :index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns only public articles to template' do
        published_articles = create_list :article, 2
        create_list :wip_article, 2
        get :index
        expect(assigns(:articles)).to match_array(published_articles)
      end
    end

    describe 'GET show' do
      let(:article) { create :article }

      it 'renders :show teplate' do
        get :show, id: article
        expect(response).to render_template(:show)
      end

      it 'assigns requested article to @article' do
        get :show, id: article
        expect(assigns(:article)).to eq(article)
      end
    end
  end

  describe 'guest user' do
    it_behaves_like 'public access to articles'

    describe 'GET new' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(login_url)
      end
    end

    describe 'POST create' do
      it 'redirects to login page' do
        post :create, attributes_for(:article)
        expect(response).to redirect_to(login_url)
      end
    end

    describe 'GET edit' do
      it 'redirects to login page' do
        get :edit, id: create(:article)
        expect(response).to redirect_to(login_url)
      end
    end

    describe 'PUT update' do
      it 'redirects to login page' do
        put :update, id: create(:article), article: attributes_for(:article)
        expect(response).to redirect_to(login_url)
      end
    end

    describe 'DELETE destroy' do
      it 'redirects to login page' do
        delete :destroy, id: create(:article)
        expect(response).to redirect_to(login_url)
      end
    end
  end

  describe 'authenticated user' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    it_behaves_like 'public access to articles'

    describe 'GET new' do
      it 'renders :new template' do
        get :new
        expect(response).to render_template(:new)
      end

      it 'assigns new Article to @article' do
        get :new
        expect(assigns(:article)).to be_a_new(Article)
      end
    end

    describe 'POST create' do
      context 'valid data' do
        let(:valid_data) { attributes_for(:article, status: 'published') }

        it 'redirects to articles#show' do
          post :create, article: valid_data
          expect(response).to redirect_to(article_path(assigns[:article]))
        end

        it 'creates new article' do
          expect do
            post :create, article: valid_data
          end.to change(Article, :count).by(1)
        end
      end

      context 'invalid data' do
        let(:invalid_data) { attributes_for(:article, title: '', status: 'wip') }

        it 'renders :new template' do
          post :create, article: invalid_data
          expect(response).to render_template(:new)
        end

        it 'does not create new article' do
          expect do
            post :create, article: invalid_data
          end.not_to change(Article, :count)
        end
      end
    end

    describe 'GET edit' do
      let(:article) { create :article }

      it 'renders :edit template' do
        get :edit, id: article
        expect(response).to render_template(:edit)
      end

      it 'assigns the requested article to template' do
        get :edit, id: article
        expect(assigns(:article)).to eq(article)
      end
    end

    describe 'PUT update' do
      let(:article) { create :article }

      context 'valid data' do
        let(:valid_article) do
          attributes_for(:article, title: 'new', slug: article.slug, status: 'published')
        end

        it 'redirects to article#show' do
          put :update, id: article, article: valid_article
          expect(response).to redirect_to(article)
        end

        it 'updates article' do
          put :update, id: article, article: valid_article
          article.reload
          expect(article.title).to eq('new')
        end
      end

      context 'invalid data' do
        let(:invalid_article) { attributes_for(:article, title: '', status: 'wip') }

        it 'renders :edit template' do
          put :update, id: article, article: invalid_article
          expect(response).to render_template(:edit)
        end

        it 'does not update article' do
          put :update, id: article, article: invalid_article
          article.reload
          expect(article.status).not_to eq(Article.statuses[:wip])
        end
      end
    end

    describe 'DELETE destroy' do
      let(:article) { create :article }

      it 'redirects to articles#index' do
        delete :destroy, id: article
        expect(response).to redirect_to(articles_path)
      end

      it 'deletes article' do
        delete :destroy, id: article
        expect(Article.exists?(article.id)).to be_falsy
      end
    end
  end
end
