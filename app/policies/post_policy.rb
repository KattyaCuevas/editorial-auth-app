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

  def update?
    return true if user.role == "editor"

    record.author_id == user.id
  end
end
