class BankAccount < ApplicationRecord
  belongs_to :user
  serialize :ledger, Array
  validates :amount, :institution, :active, presence: true
  before_create :initialize_ledger
  before_update :update_ledger

  private 

    def initialize_ledger
      self.ledger << { ledger_change: Time.now, previous_amount: 0, new_amount: self.amount }
    end

    def update_ledger
      if self.changes[:amount]
        self.ledger << { ledger_change: Time.now, previous_amount: self.changes[:amount].first, new_amount: self.amount}
      end
    end
end
 