module SocialPosting
  class Client
    PROVIDERS = %i[twitter facebook]

    def initialize(data)
      instance_providers(data)
    end

    def to(providers, text = nil, image = nil)
      providers = [providers] unless providers.is_a? Array

      providers.map do |provider|
        request = instance_variable_get("@#{provider}").call(text, image).fmap do |value|
          Response.call(provider, :ok, value)
        end

        request.right? ? request.value : Response.call(provider, :error, request.value.message)
      end
    end

    private

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
