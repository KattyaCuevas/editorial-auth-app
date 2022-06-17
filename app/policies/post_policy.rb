class PostPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.role == "editor"
        @scope.all
      else
        @scope.where(status: "published")
      end
    end
  end

  def create?
    user.role == "author"
  end
end
