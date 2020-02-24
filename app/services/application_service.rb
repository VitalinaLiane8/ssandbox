# frozen_string_literal: true

# ApplicationService for declaration the appearance of Services
class ApplicationService
  def self.call(*args)
    new(*args).call
  end
end
