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
    def new
      @project = Projects.new_with_defaults(Project)
      render locals: {
        page: Administrate::Page::Form.new(dashboard, @project),
      }
    end
  end
end
