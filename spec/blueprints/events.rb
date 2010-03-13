Event.blueprint do
  name        { "Twilight Imperium" }
  location    { "Lo de foca" }
  start_at    { 3.days.from_now }
  end_at      { start_at + 6.hours }
  description { "Vamos a jugar TI 3e!" }
end

Event.blueprint(:invalid) do
  name nil
end

Event.blueprint(:no_ending) do
  end_at nil
end

Event.blueprint(:in_the_past) do
  start_at { 1.hour.ago }
end
