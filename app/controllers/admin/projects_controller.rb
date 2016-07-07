require_relative "../../services/projects"
module Admin
  class ProjectsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Project.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Project.find_by!(slug: param)
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

    def new
      @project = Projects.new_with_defaults(Project)
      render locals: {
        page: Administrate::Page::Form.new(dashboard, @project),
      }
    end

    def resources_for_user(resources)
      if current_user.system_admin
        resources
      else
        resources.where(owner_id: current_user.id)
      end
    end
  end
end
