module Ethereum
  class ContractEvent

    attr_accessor :name, :signature, :input_types, :inputs, :event_string, :address, :client

    def initialize(data)
      @name = data["name"]
      @input_types = data["inputs"].collect {|x| x["type"]}
      @inputs = data["inputs"].collect {|x| x["name"]}
      @event_string = "#{@name}(#{@input_types.join(",")})"
      @signature = SHA3::Digest.hexdigest(:sha256, @event_string)
    end

    def set_address(address)
      @address = address
    end

    def set_client(client)
      @client = client
    end

  end
end

