class Ability
  include CanCan::Ability

  def initialize(player)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    player ||= Player.new # guest user
    if player.admin
      can :manage, :all
    elsif player.captain
      can :create, [Rating, Team]
      cannot :create, Ground, Match
      can :read, [Team, Player, Match, Ground, Rating]
      cannot :update, [Ground]
      can :update, [Rating, Match]
      can [:update, :destroy], Team do |team|
        player.team == team
      end
      can [:update, :destroy], Player do |players_profile|
        player == players_profile
      end
      cannot :destroy, [Rating, Match, Ground]
    else
      can :create, Rating
      cannot :create, [Ground, Match, Team]
      can :read, [Team, Player, Match, Ground, Rating]
      cannot :update, [Ground, Match]
      can :update, Rating
      can :update, Team do |team|
        player.team == team
      end
      can [:update,:destroy], Player do |players_profile|
        player == players_profile
      end
      cannot :destroy, [Rating, Match, Ground, Team]
    end
  end
end
