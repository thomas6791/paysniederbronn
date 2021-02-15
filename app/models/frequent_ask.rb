class FrequentAsk < ApplicationRecord
  belongs_to :frequentasked, polymorphic: true
end
