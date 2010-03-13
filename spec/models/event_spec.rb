require 'spec_helper'

describe Event do
  context "validations" do
    def event(*args)
      Event.make_unsaved(*args)
    end

    it "is optional to specify the end time" do
      event(:no_ending).should be_valid
    end

    it "doesn't allow events in the past" do
      event(:in_the_past).should_not be_valid
    end

    it "doesn't allow events that end before they start" do
      event(:start_at => Time.zone.now, :end_at => 1.hour.ago).should_not be_valid
    end
  end
end
