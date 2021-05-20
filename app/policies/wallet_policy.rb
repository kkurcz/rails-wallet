class WalletPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # use for testing
      # scope.all
      scope.where(user: user)
    end
  end

  def create?
    user == record.user
  end

  def show?
    user == record.user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

end
