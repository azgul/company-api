CompanyApi::App.controllers do

  get :index, :map => '/' do
    content_type 'application/json'

    halt 404, 'see README.md on usage'
  end

  get :get, :map => 'company/:id' do
    content_type 'application/json'

    begin
      company = Company.find(params[:id])
      company.to_json
    rescue ActiveRecord::RecordNotFound
      halt 404, 'company does not exist'
    end
  end

  get :list, :map => 'companies/all' do
    content_type 'application/json'

    companies = []

    Company.all.map do |c|
        companies << {
            id: c.id,
            name: c.name
        }
    end

    companies.to_json
  end

  post :create, :map => 'company/create' do
    content_type 'application/json'

    params = JSON.parse(request.env['rack.input'].read)

    cvr = params['cvr']
    name = params['name']
    address = params['address']
    city = params['city']
    country = params['country']
    phone = params['phone']

    if cvr.nil? || cvr.empty? ||
        name.nil? || name.empty? ||
        address.nil? || address.empty? ||
        city.nil? || city.empty? ||
        country.nil? || country.empty?

      halt 400, 'missing properties'
    end

    begin
      company = Company.new(cvr: cvr, name: name, address: address, city: city, country: country, phone: phone)
      saved = company.save

      if saved
        company.to_json
      else
        halt 500, 'could not create company'
      end
    rescue
      halt 500, 'could not create company'
    end
  end
end