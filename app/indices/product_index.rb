ThinkingSphinx::Index.define :product, :with => :active_record do
  indexes desc, :sortable => true
  indexes title, :sortable => true
end
