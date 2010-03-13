require 'spec_helper'

describe EventsController do
  before do
    sign_in User.make
    @event = Event.make
  end

  describe "GET index" do
    pending "assigns all events as @events" do
      get :index
      assigns(:events).should == [@event]
    end
  end

  describe "GET show" do
    pending "assigns the requested event as @event" do
      get :show, :id => @event.to_param
      assigns(:event).should == @event
    end
  end

  describe "GET new" do
    pending "assigns a new event as @event" do
      get :new
      assigns(:event).should be_an(Event)
    end
  end

  describe "GET edit" do
    pending "assigns the requested event as @event" do
      get :edit, :id => @event.to_param
      assigns(:event).should == @event
    end
  end

  describe "POST create" do
    context "with valid params" do
      pending "creates a new event" do
        lambda { post :create, :event => Event.plan }.should change(Event, :count)
      end

      pending "redirects to the created event" do
        post :create, :event => Event.plan
        response.should be_redirect
      end
    end

    context "with invalid params" do
      pending "assigns a newly created but unsaved event as @event" do
        post :create, :event => Event.plan(:invalid)
        assigns(:event).should be_an(Event)
      end

      pending "re-renders the 'new' template" do
        post :create, :event => Event.plan(:invalid)
        response.should render_template('new')
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      pending "updates the requested event" do
        lambda { put :update, :id => @event.to_param, :event => {} }.should change(@event.reload, :updated_at)
      end

      pending "redirects to the event" do
        put :update, :id => @event.to_param, :event => {}
        response.should redirect_to(event_url(@event))
      end
    end

    context "with invalid params" do
      pending "assigns the event as @event" do
        put :update, :id => @event.to_param, :event => Event.plan(:invalid)
        assigns(:event).should be_an(Event)
      end

      pending "re-renders the 'edit' template" do
        put :update, :id => @event.to_param, :event => Event.plan(:invalid)
        response.should render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    pending "destroys the requested event" do
      @event.should_receive(:destroy)
      delete :destroy, :id => @event.to_param
    end

    pending "redirects to the events list" do
      delete :destroy, @event.to_param
      response.should redirect_to(events_url)
    end
  end
end
