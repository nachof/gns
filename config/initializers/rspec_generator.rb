GamingNightSociety::Application.configure do
  config.generators do |g|
    g.integration_tool :rspec
    g.test_framework   :rspec, :views   => false,
                               :helpers => false,
                               :routes  => false
  end
end
