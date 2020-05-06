module AudiencesHelper
  def audience_excluding_custom
  	Audience.where.not(sub_category: Category.find_by(name: "Prospecting Lookalike").sub_categories.ids)
  end
end
