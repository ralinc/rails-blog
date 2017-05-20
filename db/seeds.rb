User.find_or_create_by email: 'admin@example.com' do |user|
  user.password = 'Abcd1234'
  user.password_confirmation = user.password
end

Article.delete_all

text = <<~TEXT
  Lorem Ipsum is simply dummy text of the printing and typesetting industry.
  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
  when an unknown printer took a galley of type and scrambled it to make a type
  specimen book. It has survived not only five centuries, but also the leap into
  electronic typesetting, remaining essentially unchanged. It was popularised
  in the 1960s with the release of Letraset sheets containing Lorem Ipsum
  passages, and more recently with desktop publishing software like Aldus
  PageMaker including versions of Lorem Ipsum.
TEXT

25.times do
  slug = ('a'..'z').to_a.sample(8).join
  Article.create title: slug, slug: slug, date: DateTime.current, content: text, status: 1
end

Article.create title: 'WiP A', slug: 'wip-a', date: 1.day.ago, content: text, status: 0
Article.create title: 'WiP B', slug: 'wip-b', date: 2.day.ago, content: text, status: 0
Article.create title: 'WiP C', slug: 'wip-c', date: 3.day.ago, content: text, status: 0
