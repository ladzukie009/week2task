class Request < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, declined: 1, approved: 2 }
end
