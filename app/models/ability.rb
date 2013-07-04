class Ability
  include CanCan::Ability

  def initialize(user)

    # If the user isn't nil
    if !user.nil?

      # Client Role
      if user.role? :client

        # Restricted Role        
        cannot :manage, :all

        # Can self reading
        can [:read], User, :id => user.id

        # Can't index, destroy and edit User        
        cannot [:index, :destroy, :edit], User


        # Can create and index incidents
        can [:create, :index], Incident

        # Can show and edit own incidents
        can [:show, :edit], Incident, creator_id: user.id
        can [:show, :edit], Incident, requester_id: user.id

        
      # Analyst Role
      elsif user.role? :analyst

        # Can self reading
        can [:read], User, :id => user.id

        # Can't index, destroy and edit User        
        cannot [:index, :destroy, :edit], User

        can :manage, Incident
        can :manage, Category
        can :manage, Solution

      # Administrator Role
      elsif user.role? :admin
        can :manage, :all
      end
    
    else

    end
    
  end

end
