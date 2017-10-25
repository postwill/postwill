module SocialPosting
  class Client
    PROVIDERS = %i[twitter facebook pinterest tumblr instagram]

    def initialize(data)
      instance_providers(data)
    end

    def to(providers, options = {})
      availables_providers(providers).each_with_object({}) do |provider, result|
        provider_service = instance_variable_get("@#{provider}")
        result[provider] = response(provider_service.call(options))
      end
    end

    private

    def availables_providers(*providers)
      providers.flatten.map { |provider| PROVIDERS.include?(provider) ? provider : nil }.compact
    end

    def response(result)
      return Response.call(:ok, result.value) if result.success?
      Response.call(:error, result.value.message)
    end

    def instance_providers(data)
      PROVIDERS.each do |provider|
        next unless data[provider]

        instance_variable_set("@#{provider}", Object.const_get(['SocialPosting::Providers::',
                                                                provider.to_s.capitalize].join)
                                                                .new(data[provider]))
      end
    end
  end
end
