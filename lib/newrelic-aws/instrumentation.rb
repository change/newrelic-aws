# encoding: utf-8
require 'new_relic/agent/method_tracer'

DependencyDetection.defer do
  @name = :aws

  executes do
    ::NewRelic::Agent.logger.info 'Installing AWS SDK instrumentation'
  end

  depends_on do
    # Enough to differentiate it from the namespace-conflicting AWS::S3 commonly in use
    defined?(AWS::Core)
  end

  executes do
    # We instrument a few AWS::Core::Client methods so we aren't blind to calls that aren't
    # yet specifically instrumented at a higher level.
    AWS::Core::Client.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :client_request
      add_method_tracer :make_async_request
      add_method_tracer :make_sync_request
    end

    AWS::S3::Bucket.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :clear!
      add_method_tracer :delete
      add_method_tracer :delete!
      add_method_tracer :objects
      add_method_tracer :versions
    end

    AWS::S3::S3Object.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :read
      add_method_tracer :write
      add_method_tracer :delete
      add_method_tracer :head

      add_method_tracer :url_for
      add_method_tracer :public_url
    end

    AWS::SQS::Queue.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :batch_delete
      add_method_tracer :batch_send
      add_method_tracer :exists?
      add_method_tracer :poll
      add_method_tracer :receive_message
      add_method_tracer :send_message
    end

    AWS::SimpleEmailService.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :send_email
      add_method_tracer :send_raw_email
    end
  end
end
