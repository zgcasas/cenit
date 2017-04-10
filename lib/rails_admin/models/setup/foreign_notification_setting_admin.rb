module RailsAdmin
  module Models
    module Setup
      module ForeignNotificationSettingAdmin
        extend ActiveSupport::Concern

        included do
          rails_admin do
            object_label_method { :label }

            edit do
              # Email setting vars
              group :email do
                label 'E-Mail'
                active { bindings[:object].send_email }
                field :send_email, :boolean do
                  label 'Send E-Mail?'
                end
                field :email_to, :string do
                  label 'To'
                  required true
                end
                field :email_subject, :string do
                  label 'Subject'
                  required true
                end
                field :email_template do
                  label 'Template'
                end
                field :email_body, :text do
                  label 'Body'
                  required true
                end
              end

              # Http setting vars
              group :http_request do
                label 'HTTP Request'
                active { bindings[:object].send_http_request }
                field :send_http_request, :boolean do
                  label 'Send HTTP Request?'
                end
                field :http_uri, :string do
                  label 'URI'
                  required true
                end
                field :http_method, :enum do
                  label 'Method'
                  required true
                  html_attributes do
                    { 'data-enum_edit': false }
                  end
                end
                field :http_params do
                  label 'Params'
                  required true
                end
              end

              # SMS setting vars
              group :SMS do
                label 'SMS'
                active { bindings[:object].send_sms }
                field :send_sms, :boolean do
                  label 'Send SMS?'
                end
                field :sms_to, :string do
                  label 'To'
                  required true
                end
                field :sms_body, :text do
                  label 'Body'
                  required true
                end
              end

              field :scripts do
                formatted_value { bindings[:object] }
                partial 'foreign_notification/form_setting_scripts'
              end
            end

          end
        end

      end
    end
  end
end
