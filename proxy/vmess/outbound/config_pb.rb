# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proxy/vmess/outbound/config.proto

require 'google/protobuf'

require_relative Dir.pwd + '/' + 'common/protocol/server_spec_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("proxy/vmess/outbound/config.proto", :syntax => :proto3) do
    add_message "xray.proxy.vmess.outbound.Config" do
      repeated :Receiver, :message, 1, "xray.common.protocol.ServerEndpoint"
    end
  end
end

module Xray
  module Proxy
    module Vmess
      module Outbound
        Config = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.proxy.vmess.outbound.Config").msgclass
      end
    end
  end
end