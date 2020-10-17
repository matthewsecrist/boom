defmodule Boom.Errors do
  @moduledoc false
  @errors %{
    bad_request: {400, "Bad Request"},
    unauthorized: {401, "Unauthorized"},
    payment_required: {402, "Payment Required"},
    forbidden: {403, "Forbidden"},
    not_found: {404, "Not Found"},
    method_not_allowed: {405, "Method Not Allowed"},
    not_acceptable: {406, "Not Acceptable"},
    proxy_authentication_required: {407, "Proxy Authentication Required"},
    request_timeout: {408, "Request Time-out"},
    conflict: {409, "Conflict"},
    gone: {410, "Gone"},
    length_required: {411, "Length Required"},
    precondition_failed: {412, "Precondition Failed"},
    request_entity_too_large: {413, "Request Entity Too Large"},
    request_uri_too_long: {414, "Request-URI Too Large"},
    unsupported_media_type: {415, "Unsupported Media Type"},
    requested_range_not_satisfiable: {416, "Requested Range Not Satisfiable"},
    expectation_failed: {417, "Expectation Failed"},
    im_a_teapot: {418, "I'm a teapot"},
    misdirected_request: {421, "Misdirected Request"},
    unprocessable_entity: {422, "Unprocessable Entity"},
    locked: {423, "Locked"},
    failed_dependency: {424, "Failed Dependency"},
    unordered_collection: {425, "Unordered Collection"},
    upgrade_required: {426, "Upgrade Required"},
    precondition_required: {428, "Precondition Required"},
    too_many_requests: {429, "Too Many Requests"},
    request_header_fields_too_large: {431, "Request Header Fields Too Large"},
    unavailable_for_legal_reasons: {451, "Unavailable For Legal Reasons"},
    internal_server_error: {500, "Internal Server Error"},
    not_implemented: {501, "Not Implemented"},
    bad_gateway: {502, "Bad Gateway"},
    service_unavailable: {503, "Service Unavailable"},
    gateway_timeout: {504, "Gateway Time-out"},
    http_version_not_supported: {505, "HTTP Version Not Supported"},
    variant_also_negotiates: {506, "Variant Also Negotiates"},
    insufficient_storage: {507, "Insufficient Storage"},
    loop_detected: {508, "Loop Detected"},
    bandwidth_limit_exceeded: {509, "Bandwidth Limit Exceeded"},
    not_extended: {510, "Not Extended"},
    network_authentication_required: {511, "Network Authentication Required"}
  }
  @doc false
  def list do
    @errors
  end

  @doc false
  def get_error_for(name) do
    case Map.fetch(@errors, name) do
      {:ok, {status_code, error_message}} -> {status_code, error_message}
      _ -> get_error_for(:internal_service_error)
    end
  end
end
