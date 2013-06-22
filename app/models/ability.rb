class Ability
  include CanCan::Ability

  def initialize(user)

    # If the user isn't nil
    if !user.nil?

      # Client Role
      if user.role? :client
        can :manage, :all

      # Analyst Role
      elsif user.role? :analyst
        can :manage, :all

      # Administrator Role
      elsif user.role? :admin
        can :manage, :all
      end
    
    else

    end
    
  end

end
