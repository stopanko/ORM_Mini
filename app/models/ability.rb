class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :see_link, :close_ticket
      can :see_link, :tickets
      can :comments, :hidden
      can :index, :tickets
    elsif user.has_role? :expectation
    elsif user.blank?
    end
  end
end
