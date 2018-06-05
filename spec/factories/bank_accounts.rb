FactoryBot.define do
  factory :bank_account do
    user nil
    amount 1.5
    ledger "MyText"
    active false
    institution "MyString"
    description "MyText"
  end
end
