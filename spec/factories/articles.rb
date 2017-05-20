FactoryGirl.define do
  factory :article do
    title 'title'
    content 'content'
    date DateTime.current
    sequence(:slug) { |_n| "slug-#{(0...10).map { ('a'..'z').to_a[rand(26)] }.join}" }
    status Article.statuses[:published]

    factory :wip_article do
      title 'wip'
      content 'work in progress'
      status Article.statuses[:wip]
    end

    factory :published_article do
      title 'published'
      content 'public content'
      status Article.statuses[:published]
    end
  end
end
