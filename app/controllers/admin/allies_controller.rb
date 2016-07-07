module Admin
  class AlliesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Ally.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Ally.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    def create
      @ally = Ally.new(ally_params)
      if @ally.save
        redirect_to admin_allies_path, notice: t("system_admin.messages.ally.created")
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, @ally),
        }
      end
    end

    private

    def ally_params
      password = Devise.friendly_token.first(8)
      params.require(:ally).permit(:name, :email).merge(password: password, password_confirmation: password)
    end
  end
end
