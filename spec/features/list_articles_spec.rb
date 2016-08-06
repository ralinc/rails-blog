require 'rails_helper'

feature 'Listing articles', js: false do
  scenario 'shows only published articles to guest users' do
    wip_article = create :wip_article
    published_articles = create_list :article, 2

    visit articles_path

    expect(page).to have_content("NUMBER OF POSTS: #{published_articles.size}")
    expect(page).not_to have_content(wip_article.title)
    published_articles.each do |article|
      expect(page).to have_css('a', text: article.title)
    end
  end

  scenario 'shows all articles to logged in users' do
    wip_article = create :wip_article
    published_article = create :article

    login
    visit articles_path
    click_on 'ALL'

    expect(page).to have_content('NUMBER OF POSTS: 2')
    expect(page).to have_css('a', text: wip_article.title)
    expect(page).to have_css('a', text: published_article.title)
  end

  scenario 'shows wip articles to logged in users' do
    wip_article = create :wip_article
    published_article = create :article

    login
    visit articles_path
    click_on 'WIP'

    expect(page).to have_content('NUMBER OF POSTS: 1')
    expect(page).to have_css('a', text: wip_article.title)
    expect(page).not_to have_css('a', text: published_article.title)
  end

  scenario 'displays articles status filter when logged in' do
    login

    visit articles_path

    expect(page).to have_css('a', text: 'WIP')
    expect(page).to have_css('a', text: 'ALL')
  end

  scenario 'does not display articles status filter when not logged in' do
    visit articles_path

    expect(page).not_to have_css('a', text: 'WIP')
    expect(page).not_to have_css('a', text: 'ALL')
  end

  scenario 'forces login when viewing all articles' do
    visit articles_path(show: 'all')

    expect_login_page page
  end

  scenario 'forces login when viewing wip articles' do
    visit articles_path(show: 'wip')

    expect_login_page page
  end
end
