describe ToysController, type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "Viewing all toys" do
    context "without search params" do
      it "renders successfully" do
        get toys_path

        expect(response).to have_http_status(200)
      end
    end

    context "with search params" do
      it "renders successfully" do
        get toys_path, search_terms: "something"

        expect(response).to have_http_status(200)
      end
    end
  end

  describe "Viewing an individual toy" do
    let(:toy) { create(:toy, seller: seller) }
    let(:seller) { create(:seller) }

    it "renders successfully" do
      get toy_path(toy)

      expect(response).to have_http_status(200)
    end
  end

  describe "Starting a new toy listing" do
    it "renders successfully" do
      get new_toy_path

      expect(response).to have_http_status(200)
    end
  end

  describe "Editing an existing toy" do
    let(:toy) { create(:toy, seller: seller) }
    let(:seller) { create(:seller) }

    it "renders successfully" do
      get edit_toy_path(toy)

      expect(response).to have_http_status(200)
    end
  end

  describe "Creating a new toy listing" do
    let(:params) { { toy: { name: name, price: price, description: description } } }
    let(:name) { Faker::Lorem.sentence }
    let(:price) { 5.00 }
    let(:description) { Faker::Lorem.paragraph(4) }
    let!(:seller) { create(:seller, user: user) }

    it "redirects successfully" do
      post toys_path, params

      expect(response).to have_http_status(302)
    end

    it "creates a new record" do
      expect{ post toys_path, params }.to change{ Toy.count }.by(1)
    end
  end

  describe "Updates an existing toy" do
    let!(:toy) { create(:toy, seller: seller) }
    let(:seller) { create(:seller, user: user) }
    let(:params) { { toy: { name: "New name" } } }

    it "updates and redirects successfully" do
      put toy_path(toy), params

      aggregate_failures do
        expect(toy.reload.name).to eq ("New name")
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "Deletes the toy listing" do
    let!(:toy) { create(:toy, seller: seller) }
    let(:seller) { create(:seller, user: user) }

    it "removes a toy record" do
      aggregate_failures do
        expect { delete toy_path(toy) }.to change{ Toy.count }.by(-1)
        expect(response).to have_http_status(302)
      end
    end
  end

end
