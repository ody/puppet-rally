# == Class: rally::policy
#
# Configure the rally policies
#
# === Parameters
#
# [*policies*]
#   (optional) Set of policies to configure for rally
#   Example :
#     {
#       'rally-context_is_admin' => {
#         'key' => 'context_is_admin',
#         'value' => 'true'
#       },
#       'rally-default' => {
#         'key' => 'default',
#         'value' => 'rule:admin_or_owner'
#       }
#     }
#   Defaults to empty hash.
#
# [*policy_path*]
#   (optional) Path to the nova policy.json file
#   Defaults to /etc/rally/policy.json
#
class rally::policy (
  $policies    = {},
  $policy_path = '/etc/rally/policy.json',
) {

  validate_hash($policies)

  Openstacklib::Policy::Base {
    file_path => $policy_path,
  }

  create_resources('openstacklib::policy::base', $policies)

}
