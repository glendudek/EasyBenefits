module ClassyEnum
  class Base
    def self.to_db
      return self.new.to_s
    end
  end
end

class CompanyUserType < ClassyEnum::Base
end

class CompanyUserType::Admin < CompanyUserType
end

class CompanyUserType::Employee < CompanyUserType
end
