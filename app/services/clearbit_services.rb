require 'clearbit'
class ClearbitServices

  def initialize(domain, name)
    @domain = domain
    @name = name
  end

  def call
    company['logo']
  end

  def company
    Clearbit.key = ENV['CLEARBIT_KEY']

    @company ||= Clearbit::Enrichment::Company.find(domain: @domain, company_name: @name)

  end
end
