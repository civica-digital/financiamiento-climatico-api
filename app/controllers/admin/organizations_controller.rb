module Admin
  class OrganizationsController < Admin::ApplicationController
    before_action :authorize_user
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

    def index
      search_term = params[:search].to_s.strip
      resources = Administrate::Search.new(resource_resolver, search_term).run
      resources = resources_for_user(resources)
      resources = order.apply(resources)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
      }
    end

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

    def authorize_user
      unless @permissions && @permissions.can_manage_organizations?
        redirect_to admin_projects_path
      end
    end

    def resources_for_user(resources)
      if current_user.system_admin
        resources
      else
        resources.where(owner_id: current_user.id)
      end
    end

    def organization_params
      password = Devise.friendly_token.first(8)
      params.require(:organization).permit(:name, :email).merge(password: password, password_confirmation: password, owner_id: current_user.id)
    end
  end
end
