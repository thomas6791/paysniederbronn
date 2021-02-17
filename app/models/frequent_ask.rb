class FrequentAsk < ApplicationRecord
  belongs_to :frequentasked, polymorphic: true
  def build_associable(params)
    self.associable = associable_type.constantize.new(params)
  end
end
