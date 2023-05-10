# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: common/protocol/server_spec.proto

require 'google/protobuf'

require_relative Dir.pwd + '/' + 'common/net/address_pb'
require_relative Dir.pwd + '/' + 'common/protocol/user_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("common/protocol/server_spec.proto", :syntax => :proto3) do
    add_message "xray.common.protocol.ServerEndpoint" do
      optional :address, :message, 1, "xray.common.net.IPOrDomain"
      optional :port, :uint32, 2
      repeated :user, :message, 3, "xray.common.protocol.User"
    end
  end
end

module Xray
  module Common
    module Protocol
      ServerEndpoint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.common.protocol.ServerEndpoint").msgclass
    end
  end
end