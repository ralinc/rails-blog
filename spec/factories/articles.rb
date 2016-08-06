FactoryGirl.define do
  factory :article do
    title 'title'
    sequence(:slug) { |n| "slug-#{n}" }
    content 'content'
    status Article.statuses[:published]

    factory :wip_article do
      title 'wip'
      content 'work in progress'
      status Article.statuses[:wip]
    end
  end
end
