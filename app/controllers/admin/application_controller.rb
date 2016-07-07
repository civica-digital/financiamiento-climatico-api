module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      unless current_user.present? && (current_user.system_admin || current_user.type == "Ally" || current_user.type == "Organization")
        redirect_to root_path, alert: I18n.t("system_admin.messages.unathorized_user")
      else
        set_permissions_for_user
      end
    end

    def set_permissions_for_user
      @permissions ||= Permissions.for_user(current_user)
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
