class Ability
  include CanCan::Ability

  def initialize(user)

    # If the user isn't nil
    if !user.nil?

      # Client Role
      if user.role? :client
        
      # Analyst Role
      elsif user.role? :analyst
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
