module ClassyEnumToDb
  extend ActiveSupport::Concern

  included do
    def self.to_db
      return self.new.to_s
    end
  end
end

class CompanyUserType < ClassyEnum::Base
  include ClassyEnumToDb
end

class CompanyUserType::Admin < CompanyUserType
end

class CompanyUserType::Employee < CompanyUserType
end
