# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe AlaveteliPro::Users::SessionsController do

  describe 'GET #new' do

    context 'with pro pricing turned off' do

      it 'raises ActiveRecord::RecordNotFound' do
        expect { get :new }.to raise_error(ActiveRecord::RecordNotFound)
      end

    end

    context 'with pro pricing turned on' do

      before do
        with_feature_enabled(:pro_pricing) do
          get :new
        end
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

    end

  end

end