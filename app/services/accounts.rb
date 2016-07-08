module Accounts
  def self.generate_token_for_resource(resource_class)
    param, record = Devise.token_generator.generate(resource_class, :reset_password_token)
    { param: param, record: record }
  end
end