class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.present? # additional permissions for logged in users
    can :manage, User, id: user.id
    can :manage, Comments, user_id: user.id
      if user.admin? # additional permissions for administrators
      can :manage, :all
      end
    end
  end
end
