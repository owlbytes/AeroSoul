class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :star, :all 
    can :vote, :all  
    can :create, Post

    can :edit, Post do |post|
      post.user == user
    end

    can :update, Post do |post|
      post.user == user
    end

    can :destroy, Post do |post|
      post.user == user
    end


    if user.role == nil
      can :read, :all
      can :create, User
    end 

    if user.role == "admin"
      can :manage, :all
    end 

  end 






    

     


       