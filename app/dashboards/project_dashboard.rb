require "administrate/base_dashboard"
require_relative "../services/projects"

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    area: Field::Select.with_options(collection: Projects.area_options),
    year: Field::Select.with_options(collection: Projects.year_options),
    name: Field::String,
    quantity: Field::String.with_options(searchable: false),
    currency: Field::Select.with_options(collection: Projects.currency_options),
    financing: Field::Select.with_options(collection: Projects.financing_options),
    region: Field::Select.with_options(collection: Projects.region_options),
    grant: Field::String,
    source: Field::String,
    organizations: Field::HasMany,
    status: Field::Select.with_options(collection: Projects.status_options),
    observations: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :area,
    :year,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :area,
    :year,
    :name,
    :quantity,
    :currency,
    :financing,
    :organizations,
    :region,
    :grant,
    :source,
    :status,
    :observations,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :grant,
    :area,
    :year,
    :name,
    :quantity,
    :currency,
    :financing,
    :organizations,
    :region,
    :source,
    :status,
    :observations,
  ].freeze

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project)
  #   "Project ##{project.id}"
  # end
end
