module Rspec::Support
  module ControllerHelpers
    def sign_in(user=nil)
      controller.stub!(:authenticate_user!).and_return(true)
      controller.stub!(:user_signed_in?).and_return(true)
      controller.stub!(:current_user).and_return(user)

      self.class.let(:current_user) { user }
    end
  end
end
