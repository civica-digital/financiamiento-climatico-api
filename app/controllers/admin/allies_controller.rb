module Admin
  class AlliesController < Admin::ApplicationController
    before_action :generate_token, only: :create
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
      @ally.reset_password_token = @token_generator[:record]
      @ally.reset_password_sent_at = Time.now

      if @ally.save
        AccountsMailer.new_account_notification(@ally, @token_generator[:param]).deliver
        redirect_to admin_allies_path, notice: t("system_admin.messages.ally.created")
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, @ally),
        }
      end
    end

    private

    def generate_token
      @token_generator ||= Accounts.generate_token_for_resource(Ally)
    end

    def ally_params
      password = Devise.friendly_token.first(8)
      params.require(:ally).permit(:name, :email).merge(password: password, password_confirmation: password)
    end
  end
end
