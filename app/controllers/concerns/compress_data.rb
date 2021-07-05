module CompressData
  extend ActiveSupport::Concern

  included do
    def compress(data)
      data.unpack1('m')
    end
  end
end
