FactoryGirl.define do
  factory :article do
    title 'title'
    sequence(:slug) { |_n| "slug-#{(0...10).map { ('a'..'z').to_a[rand(26)] }.join}" }
    content 'content'
    status Article.statuses[:published]

    factory :wip_article do
      title 'wip'
      content 'work in progress'
      status Article.statuses[:wip]
    end
  end
end
