module Admin
  class OrganizationsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Organization.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Organization.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to admin_organizations_path, notice: t("system_admin.messages.organization.created")
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, @organization),
        }
      end
    end

    private

    def organization_params
      password = Devise.friendly_token.first(8)
      params.require(:organization).permit(:name, :email).merge(password: password, password_confirmation: password)
    end
  end
end
