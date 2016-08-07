User.find_or_create_by email: 'admin@example.com' do |user|
  user.name = 'Admin'
  user.password = 'password'
  user.password_confirmation = user.password
end

Article.find_or_create_by title: 'Lorem Ipsum' do |article|
  article.slug = 'lorem-ipsum'
  article.content = <<-TEXT
  Lorem Ipsum is simply dummy text of the printing and typesetting industry.
  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
  when an unknown printer took a galley of type and scrambled it to make a type
  specimen book. It has survived not only five centuries, but also the leap into
  electronic typesetting, remaining essentially unchanged. It was popularised
  in the 1960s with the release of Letraset sheets containing Lorem Ipsum
  passages, and more recently with desktop publishing software like Aldus
  PageMaker including versions of Lorem Ipsum.
  TEXT
  article.status = 1
end

Article.find_or_create_by title: 'Quis dicunt perfecto' do |article|
  article.slug = 'quis-dicunt-perfecto'
  article.content = <<-TEXT
  Lorem ipsum dolor sit amet, eum paulo nonumes detracto ea, id liber veniam
  elaboraret pri. Ne mel recusabo abhorreant, et mel dicant virtute. Sea duis
  dissentias ad, et sit alterum vulputate temporibus, nec quis quot nullam in.
  Eum oratio repudiare ne. Pro at melius repudiandae, sed alia civibus recusabo
  ei. Vide legere doming vis eu. Ad eum dicam consequat tincidunt. His ut
  dolorem eleifend perpetua, id ius tota interesset. Ut cibo dolore
  conclusionemque eam, no quod commune probatus pro. Quis dicunt perfecto ex
  per. Etiam quaeque vix et. Bonorum epicurei sed ea. In sint doctus ponderum
  usu. Eu utamur delicata sit, vis ut brute salutand accusamus. Sed stet quot
  vulputate ad. Cum case fastidii eu. Ex magna facilisised, altera dissentias
  ad duo, an nullam alienum sed. Eruditi detraxit definiebas ad quo. Hinc everti
  expetenda ex eum, eu mel verinatum autem. Vix recteque delicatissimi ad, cu
  mea lorem saperet suavitate, meis assentior te eam. Per quodsi timeam cu.
  Ex aperiri malorum persecuti quo.
  TEXT
  article.status = 1
end

Article.find_or_create_by title: 'WiP' do |article|
  article.slug = 'wip'
  article.content = 'wip content ...'
  article.status = 0
end
