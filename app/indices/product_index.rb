ThinkingSphinx::Index.define :product, :with => :active_record do
  indexes subject, :sortable => true
  indexes content
  indexes title, :as => :title, :sortable => true

  has title, created_at, updated_at
end
