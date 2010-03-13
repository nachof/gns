module TimeHelper
  def duration_of(event)
    "Desde #{event.start_at.to_s(:short)}".tap do |duration|
      duration << " hasta #{event.end_at.to_s(:short)}" if event.end_at.present?
    end
  end
end
