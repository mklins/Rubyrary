module Admin
    class AuthorPolicy < ApplicationPolicy
        def index?
            user.admin_role? || user.books_moderator_role?
        end
        
        def show?
            user.admin_role? || user.books_moderator_role?
        end
    
        def create?
            user.admin_role? || user.books_moderator_role?
        end
    
        def update?
            user.admin_role? || user.books_moderator_role?
        end
    
        def destroy?
            user.admin_role? || user.books_moderator_role?
        end
    end
end