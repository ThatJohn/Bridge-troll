# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :locations, dependent: :nullify
  has_many :events, through: :locations
  has_many :external_events, dependent: :nullify
  has_many :regions_users, dependent: :destroy
  has_many :users, through: :regions_users
  has_many :region_leaderships, dependent: :destroy
  has_many :leaders, through: :region_leaderships, source: :user
  has_many :messages

  validates :name, presence: true
  validates :name, uniqueness: true

  def leader?(user)
    return false unless user

    user.admin? || user.region_leaderships.map(&:region_id).include?(id)
  end

  def destroyable?
    (locations_count + external_events_count).zero?
  end

  def as_json(_options = {})
    {
      name: name,
      users_subscribed_to_email_count: users.where(allow_event_email: true).count
    }
  end
end