class PaginatingDecorator < Draper::CollectionDecorator
  delegate :page, :total_count, :prev_page, :current_page, :next_page
end
