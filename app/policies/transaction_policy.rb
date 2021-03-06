class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # use for testing
        scope.all
        # raise
      # scope.where(sender_wallet: @wallet.id)
      # scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
