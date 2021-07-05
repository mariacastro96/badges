module DataFormat
  extend ActiveSupport::Concern

  included do
    def transform_to_hash(data)
      data.unpack1('H*')
    end
  end
end
