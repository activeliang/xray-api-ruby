# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: transport/global/config.proto

require 'google/protobuf'

require_relative Dir.pwd + '/' + 'transport/internet/config_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("transport/global/config.proto", :syntax => :proto3) do
    add_message "xray.transport.Config" do
      repeated :transport_settings, :message, 1, "xray.transport.internet.TransportConfig"
    end
  end
end

module Xray
  module Transport
    Config = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.transport.Config").msgclass
  end
end
