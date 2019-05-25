class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    cannot :manage, Product
    cannot :manage, User
    can :read, Product
    if user.present? # additional permissions for logged in users
    can :manage, User, id: user.id
    can :manage, Comment, user_id: user.id
    end
    if user.admin? # additional permissions for administrators
    can :manage, :all
    end
  end
end

      