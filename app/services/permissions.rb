module Permissions
  def self.for_user(user)
    Permission.new(user)
  end

  private

  class Permission < Struct.new(:user)
    def can_manage_organizations?
      user_is_ally || user_is_admin
    end

    def can_manage_allies?
      user_is_admin
    end

    def can_manage_projects?
      true
    end

    private

    def user_is_ally
      user.type == "Ally"
    end

    def user_is_admin
      user.system_admin
    end
  end
end