class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def pretty_date
  #   if self.respond_to?(:created_at)
  #     self.created_at.strftime("%d/%m/%Y")
  #   else
  #     "-"
  #   end
  # end
end
