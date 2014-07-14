class UserPolicy < BasePolicy
  def update?
    present? && (@user == record || @user.admin?)
  end

  def destroy?
    update?
  end

  def change_role?
    present? && @user.admin?
  end

  def create?
    change_role?
  end
end