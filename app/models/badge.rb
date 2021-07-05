class Badge
  attr_reader :hash, :uuid
    def initialize(hash, uuid)
      @hash = hash
      @uuid = uuid
    end
end
