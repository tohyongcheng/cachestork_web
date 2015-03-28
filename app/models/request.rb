class Request < ActiveRecord::Base
  has_and_belongs_to_many :categories

  def country_name
    c = ISO3166::Country[country]
    c.translations[I18n.locale.to_s] || c.name
  end
end
