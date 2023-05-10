# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: common/protocol/headers.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("common/protocol/headers.proto", :syntax => :proto3) do
    add_message "xray.common.protocol.SecurityConfig" do
      optional :type, :enum, 1, "xray.common.protocol.SecurityType"
    end
    add_enum "xray.common.protocol.SecurityType" do
      value :UNKNOWN, 0
      value :LEGACY, 1
      value :AUTO, 2
      value :AES128_GCM, 3
      value :CHACHA20_POLY1305, 4
      value :NONE, 5
      value :ZERO, 6
    end
  end
end

module Xray
  module Common
    module Protocol
      SecurityConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.common.protocol.SecurityConfig").msgclass
      SecurityType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.common.protocol.SecurityType").enummodule
    end
  end
end