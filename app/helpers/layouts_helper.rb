
require 'digest/md5'

module LayoutsHelper
  def gravatar
    digest = Digest::MD5.hexdigest('ralin.chimev@gmail.com')
    image_tag("http://gravatar.com/avatar/#{digest}?s=40", class: 'img-circle', alt: 'Ralin Chimev')
  end
end
