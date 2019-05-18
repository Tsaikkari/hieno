require 'rails_helper'

describe ProductsController, type: :controller do
    let!(:example_product)  { FactoryBot.create(:product) }
    let(:admin) { FactoryBot.create(:admin) }
    let(:user) { FactoryBot.create(:user) }

    describe 'GET #index' do
        it 'renders the products index template' do
            get :index
            expect(response).to be_ok
            expect(response).to render_template('index') 
        end 

        it 'assigns @products' do
            get :index
            expect(assigns(:products)).to eq example_product 
        end 
    end

    describe 'GET #show' do 
        it 'loads the correct product' do
            get :show, params: { id: example_product.id }
            expect(assigns(:product)).to eq example_product 
        end 

        it 'renders the products show template' do 
            get :show, params: { id: example_product.id }
            expect(response).to be_ok
            expect(response).to render_template('show')
        end 
    end 

    describe 'GET #new' do 
        context 'when user is logged in and is an admin' do 
            before do 
                sign_in admin
            end 

            it 'renders the products new template' do 
                get :new 
                expect(response).to be_ok 
                expect(response).to render_template('new')
            end 
        end 

        context 'when user is logged in, but is not an admin' do 
            before do 
                sign_in user 
            end 

            it 'redirects to root' do 
                get :new 
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path) 
            end 
        end 

        context 'when a user is not logged in' do 
            it 'redirects to root' do
                get :new 
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end 
        end 
    end

    describe 'GET #edit' do 
        context 'when a user is logged in and is an admin' do 
            before do 
                sign_in admin 
            end 

            it 'loads the correct product' do 
                get :edit, params: { id: example_product.id }
                expect(assigns(:product)).to eq example_product 
            end 
            
            it 'renders the products edit template' do 
                get :edit, params: { id: example_product.id }
                expect(response).to be_ok 
                expect(response).to render_template('edit')
            end 
        end 

        context 'when a user is logged in, but is not an admin' do 
            before do 
                sign_in user 
            end 

            it 'redirects to root' do 
                get :new 
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end 
        end 

        context 'when a user is not logged in' do
            it 'redirects to root' do 
                get :new 
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end 
        end 
    end 

    describe 'POST #create' do 
        context 'when a user is logged in and is an admin' do
            before do 
                sign_in admin 
            end 

            context 'with valid attributes' do 
                it 'should save the new product in the database' do 
                    expect { post :create, params: { product: { name: "Product" }}}.to change(Product, :count).by(1) 
                end 
            end 

            context 'with invalid attributes' do 
                it 'should not save the new product in the database' do 
                    expect { post :create, params: { product: { description: "Text" }}}.to_not change(Product, :count) 
                end 
            end 
        end 

        context 'when a user is logged in, but is not an admin' do 
            before do 
                sign_in user 
            end 

            it 'redirect to root' do 
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end 
        end 

        context 'when a user is not logged in' do 
            it 'redirects to root' do
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end 
        end 
    end 

    describe 'PATCH/PUT #update' do 
        context 'when a user is logged in and is an admin' do 
            before do 
                sign_in admin 
            end  

            context 'with valid attributes' do 
                it 'loads the correct product' do 
                    put :update, params: { id: example_product.id, product: { name: "Updated Name" }}
                    expect(assigns(:product)).to eq Product.last 
                end 

                it "changes the product's attributes" do 
                    put :update, params: { id: example_product.id, product: { name: "Updated Name" }}
                    example_product.reload
                    expect(example_product.name).to eq ("Updated Name")
                end
            end 

            context 'with invalid attributes' do 
                it 'loads the correct product' do
                put :update, params: { id: example_product.id, product: { name: nil }}
                expect(assigns(:product)).to eq Product.last 
                end 

                it "does not change the product's attributes" do 
                    put :update, params: { id: example_product.id, product: { name: nil, description: "Updated" }}
                    example_product.reload
                    expect(example_product.description).to_not eq("Updated")
                end 
            end
        end 

        context 'when a user is logged in, but is not an admin' do 
            before do 
                sign_in user 
            end 

            it 'redirects to root' do 
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end
        end 

        context 'when a user is not logged in' do
            it 'redirects to root' do
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end
        end
    end

    describe 'DELETE #destroy' do
        context 'when a user is logged in and is an admin' do
            before do
                sign_in admin
            end
    
            it 'loads the correct product' do
                delete :destroy, params: { id: example_product.id }
                expect(assigns(:product)).to eq example_product
            end
        
            it 'deletes the product from database' do
                expect { delete :destroy, params: { id: example_product.id }}.to change(Product, :count).by(-1)
            end
        end 

        context 'when user is logged in, but is not an admin' do
            before do
                sign_in user
            end
            
            it 'redirects to root' do
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end
        end
    
        context 'when user is not logged in' do
            it 'redirects to root' do
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end
        end
    end
end

        




            

                





