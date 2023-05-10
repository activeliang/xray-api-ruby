# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: app/proxyman/command/command.proto for package 'xray.app.proxyman.command'

require 'grpc'
require_relative Dir.pwd + '/' + 'app/proxyman/command/command_pb'

module Xray
  module App
    module Proxyman
      module Command
        module HandlerService
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'xray.app.proxyman.command.HandlerService'

            rpc :AddInbound, ::Xray::App::Proxyman::Command::AddInboundRequest, ::Xray::App::Proxyman::Command::AddInboundResponse
            rpc :RemoveInbound, ::Xray::App::Proxyman::Command::RemoveInboundRequest, ::Xray::App::Proxyman::Command::RemoveInboundResponse
            rpc :AlterInbound, ::Xray::App::Proxyman::Command::AlterInboundRequest, ::Xray::App::Proxyman::Command::AlterInboundResponse
            rpc :AddOutbound, ::Xray::App::Proxyman::Command::AddOutboundRequest, ::Xray::App::Proxyman::Command::AddOutboundResponse
            rpc :RemoveOutbound, ::Xray::App::Proxyman::Command::RemoveOutboundRequest, ::Xray::App::Proxyman::Command::RemoveOutboundResponse
            rpc :AlterOutbound, ::Xray::App::Proxyman::Command::AlterOutboundRequest, ::Xray::App::Proxyman::Command::AlterOutboundResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
