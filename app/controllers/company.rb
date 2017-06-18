CompanyApi::App.controllers do
  get :index, :map => '/' do
    {
        success: false,
        message: 'see README.md on usage'
    }.to_json
  end

  get :search, :map => 'company/search/:id' do
    company = Company.find(params[:id])

    if company
      {
          success: true,
          data: company
      }.to_json
    else
      {
          success: false,
          message: 'company does not exist'
      }.to_json
    end
  end

  get :list, :map => 'companies/all' do
    companies = []

    Company.all.map do |c|
        companies << {
            id: c.id,
            name: c.name
        }
    end

    {
        success: true,
        data: companies
    }.to_json
  end

  post :create, :map => 'company/create', :csrf_protection => false do
    params = JSON.parse(request.env['rack.input'].read)

    cvr = params['cvr']
    name = params['name']
    address = params['address']
    city = params['city']
    country = params['country']
    phone = params['phone']

    # TODO: validate input

    begin
      company = Company.new(cvr: cvr, name: name, address: address, city: city, country: country, phone: phone).save!

      {
          success: true,
          data: company.to_json
      }.to_json
    rescue
      {
          success: false,
          message: 'could not create company'
      }.to_json
    end
  end
end