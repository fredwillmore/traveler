shared_examples 'basic CRUD controller' do
  before do
    sign_in(admin)
  end

  describe "get index" do
    let(:full_path) { base_path }

    it "routes to #index" do
      expect(get: full_path).to route_to(controller: base_path, action: "index")
    end

    context "with format=html" do
      it "responds with success" do
        get :index, format: :html
        expect(response).to have_http_status(:success)
      end
    end

    context "with format=json" do
      it "responds with success" do
        get :index, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "get new" do
    let(:full_path) { "#{base_path}/new" }

    it "routes to #new" do
      expect(get: full_path).to route_to(controller: base_path, action: "new")
    end

    context "with format=html" do
      it "responds with success" do
        get :new, params: { id: 1, format: :html }
        expect(response).to have_http_status(:success)
      end
    end

    context "with format=json" do
      it "responds with success" do
        get :new, params: { id: 1, format: :json }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "post create" do
    let(:full_path) { base_path }

    it "routes to #create" do
      expect(post: full_path).to route_to(controller: base_path, action: "create")
    end

    context "with format=html" do
      it "responds with redirect" do
        post :create, params: { object_key => { name: 'Thing' }, format: :html }
        expect(response).to have_http_status(:redirect)
      end
    end
    
    context "with format=json" do
      it "responds with success" do
        post :create, params: { object_key => { name: 'Thing' }, format: :json }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "get show" do
    let(:full_path) { "#{base_path}/1" }

    it "routes to #show" do
      expect(get: full_path).to route_to(controller: base_path, action: "show", id: '1')
    end

    context "with format=html" do
      it "responds with success" do
        get :show, params: { id: 1, format: :html }
        expect(response).to have_http_status(:success)
      end
    end

    context "with format=json" do
      it "responds with success" do
        get :show, params: { id: 1, format: :json }
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "GET edit" do
    let(:full_path) { "#{base_path}/1/edit" }

    it "routes to admin/challenges#edit" do
      expect(get: full_path).to route_to(controller: base_path, action: "edit", id: '1')
    end

    context "with format=html" do
      it "responds with success" do
        get :edit, params: { id: 1, format: :html }
        expect(response).to have_http_status(:success)
      end
    end
  end
  
  describe "put update" do
    let(:full_path) { "#{base_path}/1" }

    it "routes to #update" do
      expect(put: full_path).to route_to(controller: base_path, action: "update", id: '1')
    end

    context "with format=html" do
      it "responds with redirect" do
        put :update, params: { id: 1, object_key => { name: 'Thing' }, format: :html }
        expect(response).to have_http_status(:redirect)
      end
    end
    
    context "with format=json" do
      it "responds with success" do
        put :update, params: { id: 1, object_key => { name: 'Thing' }, format: :json }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "delete destroy" do
    let(:full_path) { "#{base_path}/1" }

    it "routes to #destroy" do
      expect(delete: full_path).to route_to(controller: base_path, action: "destroy", id: '1')
    end

    context "with format=html" do
      it "responds with redirect" do
        delete :destroy, params: { id: 1, format: :html }
        expect(response).to have_http_status(:redirect)
      end
    end
    
    context "with format=json" do
      it "responds with success" do
        delete :destroy, params: { id: 1, format: :json }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
