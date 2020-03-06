class Message < ApplicationRecord
  belongs_to :user
  belongs_to :region

  after_create_commit {BroadcastMessageJob.perform_later self}
end