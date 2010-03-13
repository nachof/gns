module TimeHelper
  def schedule_for(event)
    "Desde #{event.start_at.to_s(:short)}".tap do |schedule|
      schedule << " hasta #{event.end_at.to_s(:short)}" if event.end_at.present?
    end
  end
end
