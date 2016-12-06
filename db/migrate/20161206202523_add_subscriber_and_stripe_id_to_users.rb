class AddSubscriberAndStripeIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :scorers, :subscribed, :boolean
    add_column :scorers, :stripeid, :string
  end
end
